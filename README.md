# Homebrew Scalr

This is a Homebrew tap for [Scalr CLI](https://github.com/Scalr/scalr-cli), a command-line interface for Scalr remote state & operations backend.

## Installation

```bash
# Add the tap
brew tap emocharnik/scalr

# Install scalr
brew install scalr
```

## Usage

After installation, you can use the `scalr` command:

```bash
# Check version
scalr -version

# Get help
scalr --help
```

## Formula Information

- **Package**: scalr
- **Description**: CLI for Scalr remote state & operations backend
- **Homepage**: https://scalr.com
- **Source**: https://github.com/Scalr/scalr-cli
- **License**: Apache-2.0

## Development

To update the formula:

1. Update the `url` and `sha256` in `Formula/scalr.rb`
2. Test the formula locally: `brew install --build-from-source ./Formula/scalr.rb`
3. Run the formula test: `brew test scalr`

## Support

For issues with the Scalr CLI tool itself, please visit the [official repository](https://github.com/Scalr/scalr-cli).

For issues with this Homebrew formula, please open an issue in this repository. 