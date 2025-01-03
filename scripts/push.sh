#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Arguments
REBASE=$1
BRANCH_NAME=${2:-$(git rev-parse --abbrev-ref HEAD)}
FORCE_PUSH=$3

# Check if rebase input is true
if [ "$REBASE" == "true" ]; then
    echo "::debug::Rebase is true. Ensuring branch tracking information is set."
    # Ensure the branch is tracking the correct remote branch
    git branch --set-upstream-to=origin/"$BRANCH_NAME" || true

    echo "::debug::Running git pull --rebase."
    git pull --rebase origin "$BRANCH_NAME" || true
fi

# Push the committed changes to the remote repository on the specified branch
if [ "$FORCE_PUSH" == "true" ]; then
    echo "::warning::Force push is enabled. Using --force."
    git push --force origin "$BRANCH_NAME"
else
    echo "::debug::Pushing changes to branch $BRANCH_NAME."
    git push origin "$BRANCH_NAME" || git push -u origin "$BRANCH_NAME"
fi

echo "::notice::Pushed the committed changes to the remote repository on branch $BRANCH_NAME."
