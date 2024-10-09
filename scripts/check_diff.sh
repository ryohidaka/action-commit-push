#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Change to root directory of repository
cd "$GITHUB_WORKSPACE"

# Get arguments from the inputs
files="${1}"

# Add the specified files (file/directory) to the git staging area
git add "$files"

# Check if there are any staged changes; exit if none
if git diff --cached --exit-code >/dev/null; then
	echo "::warning::No changes to commit. Skipping commit and push."
	exit 0
fi

# Output list of files with staged changes
echo "Staged files with changes:"
git diff --cached --name-only
