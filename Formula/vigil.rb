class Vigil < Formula
  desc "Local-first security auditor with 263 deterministic rules and an MCP server"
  homepage "https://github.com/LevapVeeskela/lv24-vigil"
  url "https://github.com/LevapVeeskela/lv24-vigil/archive/refs/tags/v0.10.3.tar.gz"
  version "0.10.3"
  sha256 "64eec4a02c7b38cd5f93ababd8aced565873f52d6ac620efc02302147a09f741"
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
