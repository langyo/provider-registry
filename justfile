set dotenv-load
set shell := ["bash", "-c"]
set windows-shell := ["bash.exe", "-c"]
set unstable
set lists

# Shared celestia-devtools recipes — NOT in git. Stage with: just fetch.
import? "./.just/celestia-devtools.just"

# Stage shared celestia-devtools recipes into .just/ (gitignored).
[script('bash')]
fetch URL='':
    #!/usr/bin/env bash
    set -euo pipefail
    out=.just/celestia-devtools.just
    mkdir -p .just
    if [ -n "{{URL}}" ]; then
      curl -fsSL "{{URL}}" -o "$out"
    elif command -v celestia-devtools >/dev/null 2>&1; then
      cp "$(celestia-devtools include-path)" "$out"
    else
      curl -fsSL "https://raw.githubusercontent.com/celestia-island/celestia-devtools/dev/src/celestia_devtools/common.just" -o "$out"
    fi
    echo "[fetch] wrote $out"

default:
    @just --list

fmt:
    ruff check --fix . 2>/dev/null || black . 2>/dev/null || true

sync source='all' providers='all':
    python3 scripts/update_models.py --source {{ source }} --entrypoint-mode --providers {{ providers }}

sync-individual source='all' providers='all':
    python3 scripts/update_models.py --source {{ source }} --entrypoint-mode --individual-models --providers {{ providers }}

# Merge master (config-table source of truth) into dev. Fast, no model fetches.
merge-dev:
    python3 scripts/merge_master_to_dev.py
