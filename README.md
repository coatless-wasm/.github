# .github

GitHub specific template files for the
[coatless-wasm](https://github.com/coatless-wasm) organization. Every
repository in the organization uses them, unless it has its own copy of a file.

| Path | Purpose |
|------|---------|
| `profile/README.md` | The organization's front page |
| `.github/ISSUE_TEMPLATE/` | The bug report and feature request forms |
| `.github/PULL_REQUEST_TEMPLATE.md` | The pull request checklist |
| `.github/FUNDING.yml` | The Sponsor button |
| `SECURITY.md` | The way to report a vulnerability |
| `labels.json`, `tools/sync-labels.sh` | The issue and pull request labels |

A repository with any file in its own `.github/ISSUE_TEMPLATE/` uses none of
the forms here.

## Labels

Every repository carries the same labels, the set the
[coatless-quarto](https://github.com/coatless-quarto) organization uses. A
prefix says what a label records:

| Prefix | Records | Labels |
|--------|---------|--------|
| `t:` | The type of issue | `bug`, `chore`, `discussion`, `documentation`, `enhancement`, `feature-request`, `question`, `upstream` |
| `s:` | Its status | `triage-needed`, `confirmed`, `can't reproduce`, `needs information`, `duplicate`, `won't do/fix`, `question-needs-answer`, `question-answered` |
| `p:` | Its priority | `critical`, `high`, `medium`, `low` |

`good first issue` and `help wanted` keep GitHub's names.

The forms set an issue's type (Bug or Feature, two of the organization's issue
types) and label it, and GitHub leaves out a label the repository does not
have. `labels.json` holds the labels, and `tools/sync-labels.sh` brings a
repository to them with the [GitHub CLI](https://cli.github.com):

```sh
tools/sync-labels.sh              # every repository that is not archived
tools/sync-labels.sh webrarian    # only the repositories named
```

A new repository starts with GitHub's default labels. The script renames the
ones that have a counterpart here (`bug` becomes `t: bug`), so issues keep
their labels, and deletes a retired label only when nothing carries it. A
label that `labels.json` does not name is left alone.
