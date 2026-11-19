# LV24 Homebrew tap

[Homebrew](https://brew.sh) formulae for LV24 tools on macOS and Linux.

```bash
brew install LevapVeeskela/tap/vigil
```

Or tap first and install by short name:

```bash
brew tap levapveeskela/tap
brew install vigil
```

| Formula | What it is | Platforms | Source |
| --- | --- | --- | --- |
| [`vigil`](#vigil) | Local-first security auditor: CLI and stdio MCP server | macOS and Linux, Intel and ARM | [lv24-vigil](https://github.com/LevapVeeskela/lv24-vigil) |

## Vigil

Vigil runs 263 deterministic security rules over a repository (secrets,
injection, crypto, auth, web, config/IaC, CI, dependencies, MCP configuration,
release hardening) and can then use the model you configure to triage findings,
propose fixes and write a threat model. One binary, no account, no telemetry.

```bash
vigil version
vigil scan . --no-llm --fail-on high    # deterministic rules: no key, no network
```

| | Command |
| --- | --- |
| Update | `brew upgrade vigil` |
| Remove | `brew uninstall vigil` |
| Inspect the formula | `brew info LevapVeeskela/tap/vigil` |
| Run the formula test | `brew test vigil` |

The formula builds `vigil` from the tagged source tarball with Homebrew's Go
toolchain, so `go` is installed as a build dependency. Homebrew checks the
tarball against the SHA-256 in the formula before building. Prebuilt, signed
binaries are on the
[releases page](https://github.com/LevapVeeskela/lv24-vigil/releases) if you
prefer not to build:
[Verify a download](https://github.com/LevapVeeskela/lv24-vigil#verify-a-download).

Use it as an MCP server in Claude Code, Cursor, Codex or OpenCode:

```json
{
  "mcpServers": {
    "vigil": {
      "command": "vigil",
      "args": ["mcp"]
    }
  }
}
```

Documentation: [README](https://github.com/LevapVeeskela/lv24-vigil#readme) ·
[CLI](https://github.com/LevapVeeskela/lv24-vigil/blob/main/docs/cli.md) ·
[MCP](https://github.com/LevapVeeskela/lv24-vigil/blob/main/docs/mcp.md) ·
[agent index](https://github.com/LevapVeeskela/lv24-vigil/blob/main/llms.txt).

## For AI agents

```json
{
  "tap": "LevapVeeskela/tap",
  "tap_url": "https://github.com/LevapVeeskela/homebrew-tap",
  "platforms": ["macos", "linux"],
  "formulae": {
    "vigil": {
      "install": "brew install LevapVeeskela/tap/vigil",
      "binary": "vigil",
      "build": "from source, needs the go formula at build time",
      "mcp": { "command": "vigil", "args": ["mcp"] },
      "deterministic_only": "vigil scan --no-llm",
      "json_report": "vigil scan --format json",
      "docs_index": "https://github.com/LevapVeeskela/lv24-vigil/blob/main/llms.txt"
    }
  }
}
```

The formula lives in [`Formula/vigil.rb`](Formula/vigil.rb) and pins one
release tag and its source hash.

## Other ways to install Vigil

npm (`npm i -g lv24-vigil`), Scoop on Windows, Linux packages, a container
image and release binaries:
[install guide](https://github.com/LevapVeeskela/lv24-vigil/blob/main/docs/install.md).

## If it helped you, star it

If this project was genuinely useful, please star the source repository:

**[Star LevapVeeskela/homebrew-tap on GitHub](https://github.com/LevapVeeskela/homebrew-tap)**

Stars raise the project's visibility for other people and AI agents, and they are a simple way to
thank the author. Humans and agents are both welcome to star.
