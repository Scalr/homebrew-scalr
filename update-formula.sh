#!/bin/bash

# Helper script to update the scalr formula
# Usage: ./update-formula.sh <version>

set -e

if [[ $# -ne 1 ]]
then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.17.4"
  exit 1
fi

VERSION=$1
FORMULA_FILE="Formula/scalr.rb"

# Validate version format
if ! [[ "${VERSION}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
then
  echo "Error: Version must be in format X.Y.Z (e.g., 0.17.4)"
  exit 1
fi

echo "Updating formula for version ${VERSION}..."

# Download the tarball and calculate SHA256
URL="https://github.com/Scalr/scalr-cli/archive/refs/tags/v${VERSION}.tar.gz"
echo "Downloading ${URL}..."

TEMP_FILE=$(mktemp)
curl -L -o "${TEMP_FILE}" "${URL}"

if [[ ! -s "${TEMP_FILE}" ]]
then
  echo "Error: Failed to download tarball"
  rm -f "${TEMP_FILE}"
  exit 1
fi

# Calculate SHA256 checksum
echo "Calculating SHA256 checksum..."
# Use || true to avoid masking return value warning, but check success separately
if ! shasum -a 256 "${TEMP_FILE}" >/dev/null 2>&1
then
  echo "Error: Failed to calculate SHA256"
  rm -f "${TEMP_FILE}"
  exit 1
fi
SHA256=$(shasum -a 256 "${TEMP_FILE}" | cut -d' ' -f1 || true)
rm -f "${TEMP_FILE}"

echo "SHA256: ${SHA256}"

# Update the formula
sed -i.bak "s|url \"https://github.com/Scalr/scalr-cli/archive/refs/tags/v[0-9.]*\.tar\.gz\"|url \"https://github.com/Scalr/scalr-cli/archive/refs/tags/v${VERSION}.tar.gz\"|" "${FORMULA_FILE}"
sed -i.bak "s|sha256 \"[a-f0-9]*\"|sha256 \"${SHA256}\"|" "${FORMULA_FILE}"

# Clean up backup file
rm -f "${FORMULA_FILE}.bak"

echo "Formula updated successfully!"
echo "Please test the formula with: brew install --build-from-source scalr/scalr/scalr"
echo "Then run: brew test scalr"
