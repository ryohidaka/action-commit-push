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
  bump-uses:
    runs-on: ubuntu-latest
    steps:
      - uses: ryohidaka/action-commit-push@v1
        with:
          who-to-greet: "Mona the Octocat"

      - run: echo random-number "$RANDOM_NUMBER"
        shell: bash
        env:
          RANDOM_NUMBER: ${{ steps.foo.outputs.random-number }}
```

## Inputs

| Input          | Description  | Required | Default |
| -------------- | ------------ | -------- | ------- |
| `who-to-greet` | Who to greet | ✅       | `World` |

## Outputs

| Output          | Description   | Example |
| --------------- | ------------- | ------- |
| `random-number` | Random number | `9999`  |
