#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Push the committed changes to the remote repository
git push

echo "::notice::Push the committed changes to the remote repository."
