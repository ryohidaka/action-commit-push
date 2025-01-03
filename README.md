# Simple Commit and Push

[![GitHub Release](https://img.shields.io/github/v/release/ryohidaka/action-commit-push)](https://github.com/ryohidaka/action-commit-push/releases/)
[![Test Action](https://github.com/ryohidaka/action-commit-push/actions/workflows/test.yml/badge.svg)](https://github.com/ryohidaka/action-commit-push/actions/workflows/test.yml)

GitHub Actions for commiting & pushing to GitHub repository local changes.

## Usage

```yml
on: [push]

permissions:
  contents: write

jobs:
  commit-push:
    runs-on: ubuntu-latest
    steps:
      - uses: ryohidaka/action-commit-push@v0.4.2
        with:
          files: "."
          branch: "main"
          commit-user-name: "GitHub Actions"
          commit-user-email: "actions@github.com"
          commit-message: "chore: autopublish"
          rebase: true
          force-push: true
          dry-run: false
```

## Inputs

| Input               | Description                                              | Default              |
| ------------------- | -------------------------------------------------------- | -------------------- |
| `files`             | Files to commit.                                         | `.`                  |
| `branch`            | The branch to push changes to.                           | current branch       |
| `commit-user-name`  | Commit username.                                         | `GitHub Actions`     |
| `commit-user-email` | Commit email.                                            | `actions@github.com` |
| `commit-message`    | Commit message.                                          | `chore: autopublish` |
| `rebase`            | If true, `git pull --rebase` is used before the push.    | `false`              |
| `force-push`        | If true, `git push --force` is used. Defaults to 'false' | `false`              |
| `dry-run`           | If true, the push steps will be skipped.                 | `false`              |
