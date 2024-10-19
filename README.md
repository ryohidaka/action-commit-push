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
      - uses: ryohidaka/action-commit-push@v0.3.0
        with:
          files: "."
          commit-user-name: "GitHub Actions"
          commit-user-email: "actions@github.com"
          commit-message: "chore: autopublish"
          rebase: true
          dry-run: false
```

## Inputs

| Input               | Description                                           | Default              |
| ------------------- | ----------------------------------------------------- | -------------------- |
| `files`             | Files to commit.                                      | `.`                  |
| `commit-user-name`  | Commit username.                                      | `GitHub Actions`     |
| `commit-user-email` | Commit email.                                         | `actions@github.com` |
| `commit-message`    | Commit message.                                       | `chore: autopublish` |
| `rebase`            | If true, `git pull --rebase` is used before the push. | `false`              |
| `dry-run`           | If true, the push steps will be skipped.              | `false`              |
