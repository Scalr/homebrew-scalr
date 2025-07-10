#!/bin/bash

# Helper script to test the scalr formula locally
# Usage: ./test-formula.sh

set -e

echo "Testing scalr formula locally..."

# Check if Homebrew is installed
if ! command -v brew &>/dev/null
then
  echo "Error: Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

echo "1. Checking formula syntax..."
ruby -c ./Formula/scalr.rb
echo "✓ Syntax check passed"

echo "2. Testing formula installation..."
brew install --build-from-source ./Formula/scalr.rb

echo "3. Testing installed binary..."
scalr -version

echo "4. Running formula test..."
brew test scalr

echo "✓ All tests passed!"
echo "To uninstall: brew uninstall scalr"
