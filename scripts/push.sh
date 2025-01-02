#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Check if rebase input is true
if [ "$1" == "true" ]; then
    echo "::debug::Rebase is true. Running git pull --rebase."
    git pull --rebase
fi

# Set the branch to push if not provided as an argument
BRANCH_NAME=${2:-${GITHUB_REF##*/}}  # Use input branch or default to current branch

# Push the committed changes to the remote repository on the specified branch
git push origin "$BRANCH_NAME"

echo "::notice::Pushed the committed changes to the remote repository on branch $BRANCH_NAME."
