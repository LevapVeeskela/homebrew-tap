# LV24 Homebrew tap

Homebrew formulae for LV24 apps and tools.

## Install

```bash
brew tap levapveeskela/tap
brew install vigil
```

Or in one step:

```bash
brew install LevapVeeskela/tap/vigil
```

## Formulae

| Formula | Description |
| --- | --- |
| `vigil` | Local-first security auditor with 263 deterministic rules and a stdio MCP server |

`vigil` is built from the tagged source tarball with the Go toolchain, so the
formula needs `go` at install time and works on both macOS and Linux.

After installing:

```bash
vigil version
vigil scan . --no-llm --fail-on high
```
