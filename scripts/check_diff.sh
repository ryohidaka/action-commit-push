#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Get arguments from the inputs
files="${1}"

# Add the specified files (file/directory) to the git staging area
git add "$files"

# Check if there are any staged changes; exit if none
if git diff --cached --exit-code >/dev/null; then
    echo "::warning::No changes to commit. Skipping commit and push."
    exit 0
fi
