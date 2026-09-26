#!/usr/bin/env bash
# Export a pip-compatible, hash-pinned requirements file from uv.lock.
set -euo pipefail

uv export \
  --format requirements.txt \
  --locked \
  --no-dev \
  --no-emit-project \
  --output-file requirements.txt
