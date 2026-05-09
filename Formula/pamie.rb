class Pamie < Formula
  desc "Self-hosted long-term memory server for MCP agents"
  homepage "https://pamie.io"
  url "https://github.com/kurocho/pamie/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "3aea7093ae80e6b9549b6c07cb43948c1e52a9e530fdd64154210a835c443ee6"
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

  def caveats
    <<~EOS
      Run `pamie start` to start the local background server.
      Use `pamie status`, `pamie token`, and `pamie stop` to manage it.
    EOS
  end

  test do
    assert_match "pamie #{version}", shell_output("#{bin}/pamie --version")
  end
end
