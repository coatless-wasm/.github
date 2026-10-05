#!/usr/bin/env bash
# Bring the organization's repositories to the labels in labels.json.
#
# A label is created, or updated when it exists. A label with "replaces" takes
# over the label of that name, by renaming it, so issues keep it. A "retired"
# label, or a replaced one left beside its successor, is deleted only when no
# issue or pull request carries it. Any other label is left alone.
#
# Usage: tools/sync-labels.sh [repository ...]
#   With no arguments, every repository in the organization that is not archived.
#
# Needs the GitHub CLI (gh), signed in, and jq.
set -euo pipefail

org="coatless-wasm"
labels="$(cd "$(dirname "$0")/.." && pwd)/labels.json"
sep=$'\037'

if [ "$#" -gt 0 ]; then
  repos="$*"
else
  repos="$(gh repo list "$org" --no-archived --limit 200 --json name --jq '.[].name')"
fi

for repo in $repos; do
  echo "$org/$repo"
  existing="$(gh label list --repo "$org/$repo" --limit 500 --json name --jq '.[].name')"

  has() { printf '%s\n' "$existing" | grep -Fxq -- "$1"; }

  retire() {
    used="$(gh api -X GET "repos/$org/$repo/issues" -f labels="$1" -f state=all \
      -F per_page=1 --jq 'length' < /dev/null)"
    if [ "$used" = "0" ]; then
      gh label delete "$1" --repo "$org/$repo" --yes < /dev/null
      echo "  deleted: $1"
    else
      echo "  kept: $1 (an issue or pull request carries it)"
    fi
  }

  jq -r --arg sep "$sep" \
    '.labels[] | [.name, .color, .description, (.replaces // "")] | join($sep)' "$labels" |
    while IFS="$sep" read -r name color description replaces; do
      if [ -n "$replaces" ] && has "$replaces" && ! has "$name"; then
        gh label edit "$replaces" --repo "$org/$repo" --name "$name" --color "$color" \
          --description "$description" < /dev/null > /dev/null
        echo "  renamed: $replaces -> $name"
      else
        gh label create "$name" --repo "$org/$repo" --color "$color" \
          --description "$description" --force < /dev/null > /dev/null
        if [ -n "$replaces" ] && has "$replaces"; then retire "$replaces"; fi
      fi
    done

  jq -r '.retired[]' "$labels" |
    while IFS= read -r name; do
      if has "$name"; then retire "$name"; fi
    done
done
