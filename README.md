# ZakoCoin (Clarity)

ZakoCoin is a simple fungible token written in Clarity for the Stacks blockchain. This repo is a Clarinet project containing the `zakocoin` contract and basic usage instructions.

## Prerequisites
- Linux with bash
- Clarinet CLI (installed below)

## Install Clarinet
Install the Clarinet CLI (prebuilt binary) to `~/.local/bin` and verify:

```bash
curl -fL -o /tmp/clarinet.tar.gz https://github.com/stx-labs/clarinet/releases/download/v3.9.1/clarinet-linux-x64-glibc.tar.gz \
  && mkdir -p "$HOME/.local/bin" \
  && tar -xzf /tmp/clarinet.tar.gz -C "$HOME/.local/bin" clarinet \
  && chmod +x "$HOME/.local/bin/clarinet"

# Ensure it's on your PATH for this shell
export PATH="$HOME/.local/bin:$PATH"
clarinet --version
```

## Project layout
- `Clarinet.toml` – project manifest
- `contracts/zakocoin.clar` – fungible token contract
- `tests/` – place for Clarinet tests (none yet)

## Contract overview
- Token symbol: `ZAKO`
- Decimals: `6`
- Initial supply: `1,000,000,000` base units (minted once to the caller of `initialize`)

### Public entrypoints
- `(initialize)` – mints the initial supply to `tx-sender`; callable once
- `(transfer amount recipient)` – transfers tokens from `tx-sender` to `recipient`

### Read-only
- `(get-balance owner)` – returns `uint`
- `(get-total-supply)` – returns `uint`
- `(get-name)`, `(get-symbol)`, `(get-decimals)` – metadata

## Build / check
From the project root:

```bash
export PATH="$HOME/.local/bin:$PATH"
clarinet check
```

## Quick usage in Clarinet console
```bash
export PATH="$HOME/.local/bin:$PATH"
clarinet console
```
Inside the console:
```clarity
(contract-call? .zakocoin initialize)
(contract-call? .zakocoin transfer u100 'ST2J...RECIPIENT)
```

## Testing
Add test files in `tests/` using Clarinet’s JS test harness or `console` scripts.

## License
MIT
