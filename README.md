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

A repository with any file in its own `.github/ISSUE_TEMPLATE/` uses none of
the forms here.

## Labels

Every repository carries the `t:` (type), `s:` (status) and `p:` (priority)
labels kept in [coatless/.github](https://github.com/coatless/.github), which
also holds the script that puts them on a repository:

```sh
tools/sync-labels.sh coatless-wasm
```

The forms set an issue's type (Bug or Feature, two of the organization's issue
types) and label it, and GitHub leaves out a label the repository does not
have, so run the script on a new repository before its first issue arrives.
