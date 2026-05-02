class Pamie < Formula
  desc "Self-hosted long-term memory server for MCP agents"
  homepage "https://pamie.io"
  url "https://github.com/kurocho/pamie/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a7ee1ba06276b6755574e080d00ed245e9e488fbcc95da1b548df12ae0025e7f"
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
