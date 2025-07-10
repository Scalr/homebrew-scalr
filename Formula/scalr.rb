# typed: false
# frozen_string_literal: true

# CLI for Scalr remote state & operations backend
class Scalr < Formula
  desc "CLI for Scalr remote state & operations backend"
  homepage "https://scalr.com"
  url "https://github.com/Scalr/scalr-cli/archive/refs/tags/v0.17.4.tar.gz"
  sha256 "4409a68b8ed7ff1e855a1e35a2bfda5cf19d3722788e5fc493311a3d365eb950"
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
