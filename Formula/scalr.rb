# typed: false
# frozen_string_literal: true

# CLI for Scalr remote state & operations backend
class Scalr < Formula
  desc "CLI for Scalr remote state & operations backend"
  homepage "https://scalr.com"
  url "https://github.com/Scalr/scalr-cli/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "37fdf8d23d76937df1029d74f5496c7ae0b8af99785d014b051b1313c9a2813d"
  license "Apache-2.0"
  head "https://github.com/Scalr/scalr-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    # Get build information
    build_date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")

    # Build with dynamic version information
    system "go", "build",
           "-ldflags", "-s -w -X main.versionCLI=#{version} -X main.buildDate=#{build_date}",
           "-o", bin/"scalr", "."
  end

  test do
    # Test that the binary runs and shows version
    output = shell_output("#{bin}/scalr -version")

    # Check if it contains version information (handles both old and new format)
    assert_match(/scalr-cli version/, output)
  end
end
