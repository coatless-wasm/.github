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

The forms set an issue's type (Bug or Feature, two of the organization's issue
types) and label it, and GitHub leaves out a label the repository does not
have. `labels.json` lists the labels every repository
carries, and `tools/sync-labels.sh` creates or updates them with the
[GitHub CLI](https://cli.github.com):

```sh
tools/sync-labels.sh              # every repository that is not archived
tools/sync-labels.sh webrarian    # only the repositories named
```

The script never deletes a label, so a repository keeps any label of its own.
