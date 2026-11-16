class Vigil < Formula
  desc "Local-first security auditor with 263 deterministic rules and an MCP server"
  homepage "https://github.com/LevapVeeskela/lv24-vigil"
  url "https://github.com/LevapVeeskela/lv24-vigil/archive/refs/tags/v0.10.1.tar.gz"
  version "0.10.1"
  sha256 "97e8c68702d7ab3119b8303b1b3648141bf62cb1984fa4ba47caeea419e2ff5f"
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
