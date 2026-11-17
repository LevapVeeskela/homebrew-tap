class Vigil < Formula
  desc "Local-first security auditor with 263 deterministic rules and an MCP server"
  homepage "https://github.com/LevapVeeskela/lv24-vigil"
  url "https://github.com/LevapVeeskela/lv24-vigil/archive/refs/tags/v0.10.2.tar.gz"
  version "0.10.2"
  sha256 "ed8fef6571f9acefbe2a3a81059962b594b312b1c1c8fddfc89c502070cba752"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/levapveeskela/lv24-vigil/internal/version.Version=#{version}", "-o", bin/"vigil", "./cmd/vigil"
  end

  test do
    system "#{bin}/vigil", "version"
    assert_match "vigil #{version}", shell_output("#{bin}/vigil version")
  end
end
