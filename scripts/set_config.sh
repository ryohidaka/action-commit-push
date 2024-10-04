#!/bin/bash
set -e # Exit immediately if any command exits with a non-zero status

# Get arguments from the inputs
name="${1}"
email="${2}"

# Configure git user name locally for this repository
git config --local user.name "$name"

# Configure git user email locally for this repository
git config --local user.email "$email"
