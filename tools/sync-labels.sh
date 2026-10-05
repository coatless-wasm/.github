#!/usr/bin/env bash
# Create or update the labels in labels.json on the organization's repositories.
# No label is ever deleted, so a repository keeps any label of its own.
#
# Usage: tools/sync-labels.sh [repository ...]
#   With no arguments, every repository in the organization that is not archived.
#
# Needs the GitHub CLI (gh), signed in, and jq.
set -euo pipefail

org="coatless-wasm"
labels="$(cd "$(dirname "$0")/.." && pwd)/labels.json"

if [ "$#" -gt 0 ]; then
  repos="$*"
else
  repos="$(gh repo list "$org" --no-archived --limit 200 --json name --jq '.[].name')"
fi

for repo in $repos; do
  echo "$org/$repo"
  jq -r '.[] | [.name, .color, .description] | @tsv' "$labels" |
    while IFS=$'\t' read -r name color description; do
      gh label create "$name" --repo "$org/$repo" --color "$color" \
        --description "$description" --force < /dev/null
    done
done
