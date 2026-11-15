class Vigil < Formula
  desc "Local-first security auditor with 263 deterministic rules and an MCP server"
  homepage "https://github.com/LevapVeeskela/lv24-vigil"
  url "https://github.com/LevapVeeskela/lv24-vigil/archive/refs/tags/v0.9.2.tar.gz"
  version "0.9.2"
  sha256 "46a36f9857c3d685d68e6e3888ba535185fe5b12386a939964154a31cc00c470"
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
