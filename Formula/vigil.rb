class Vigil < Formula
  desc "Local-first security auditor with 263 deterministic rules and an MCP server"
  homepage "https://github.com/LevapVeeskela/lv24-vigil"
  url "https://github.com/LevapVeeskela/lv24-vigil/archive/refs/tags/v0.10.0.tar.gz"
  version "0.10.0"
  sha256 "5ff7f7a35c77702b31ad03825773c9c378449a904ab63d5320d72ed7eb3335c7"
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
