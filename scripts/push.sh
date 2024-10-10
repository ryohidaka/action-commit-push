#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Check if rebase input is true
if [ "$1" == "true" ]; then
    echo "::debug::Rebase is true. Running git pull --rebase."
    git pull --rebase
fi

# Push the committed changes to the remote repository
git push

echo "::notice::Push the committed changes to the remote repository."
