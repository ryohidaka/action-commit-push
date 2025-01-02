#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Use the provided branch name or fallback to the current branch
BRANCH_NAME=${2:-$(git rev-parse --abbrev-ref HEAD)}

# Check if rebase input is true
if [ "$1" == "true" ]; then
    echo "::debug::Rebase is true. Ensuring branch tracking information is set."
    # Ensure the branch is tracking the correct remote branch
    git branch --set-upstream-to=origin/"$BRANCH_NAME" || true

    echo "::debug::Running git pull --rebase."
    git pull --rebase origin "$BRANCH_NAME"
fi

# Push the committed changes to the remote repository on the specified branch
git push origin "$BRANCH_NAME"

echo "::notice::Pushed the committed changes to the remote repository on branch $BRANCH_NAME."
