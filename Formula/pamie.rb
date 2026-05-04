class Pamie < Formula
  desc "Self-hosted long-term memory server for MCP agents"
  homepage "https://pamie.io"
  url "https://github.com/kurocho/pamie/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "752e06a3e4188238acbca16c32a481189b307716b9a511dc95e317629083ecba"
  license "AGPL-3.0-only"
  head "https://github.com/kurocho/pamie.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X main.version=#{version}
    ]

    system "go", "build", "-trimpath", "-ldflags", ldflags.join(" "), "-o", bin/"pamie", "./cmd/pamie"
  end

  test do
    assert_match "pamie #{version}", shell_output("#{bin}/pamie --version")
  end
end
