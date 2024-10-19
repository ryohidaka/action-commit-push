#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Get arguments from the inputs
files="${1}"

# Convert space-separated list into newline-separated for xargs
echo "$files" | tr ' ' '\n' | xargs -I {} git add "{}"

# Check if there are any staged changes; exit if none
if git diff --cached --exit-code >/dev/null; then
    echo "changes=false" >>$GITHUB_OUTPUT
    echo "::warning::No changes to commit. Skipping commit and push."
else
    echo "changes=true" >>$GITHUB_OUTPUT
    echo "Staged files with changes:"
    git diff --cached --name-only
fi
