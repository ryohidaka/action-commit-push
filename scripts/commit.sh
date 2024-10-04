#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Get arguments from the inputs
message="${1}"

# Commit the staged changes with the specified message
git commit -m "$message"

echo "::notice::Commit the staged changes with the message: $message."
