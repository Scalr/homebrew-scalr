# Homebrew Scalr

This is a Homebrew tap for [Scalr CLI](https://github.com/Scalr/scalr-cli), a command-line interface for Scalr remote state & operations backend.

## Installation

```bash
# Add the tap
brew tap Scalr/scalr

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

### Updating the Formula

#### Automatic Updates (Recommended)
The repository automatically checks for new scalr-cli releases daily and creates pull requests with updates.

#### Manual Updates
You can update the formula in several ways:

1. **Using the helper script locally:**
   ```bash
   ./update-formula.sh 0.17.4
   brew install --build-from-source scalr/scalr/scalr
   brew test scalr
   ```

2. **Using GitHub Actions:**
   - Go to Actions → "Update Formula and Publish Release"
   - Click "Run workflow" and enter the new version
   - This will automatically update, test, and create a release

3. **Manual editing:**
   - Update the `url` and `sha256` in `Formula/scalr.rb`
   - Test the formula locally: `brew install --build-from-source scalr/scalr/scalr`
   - Run the formula test: `brew test scalr`

## Support

For issues with the Scalr CLI tool itself, please visit the [official repository](https://github.com/Scalr/scalr-cli).

For issues with this Homebrew formula, please open an issue in this repository. 