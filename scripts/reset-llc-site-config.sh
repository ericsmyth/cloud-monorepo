#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_CONFIG="${REPO_ROOT}/config/llc-site/config.example.json"
TARGET_CONFIG="${REPO_ROOT}/apps/llc-site/public/config.json"

if [[ ! -f "${SOURCE_CONFIG}" ]]; then
  echo "Missing example config: ${SOURCE_CONFIG}" >&2
  exit 1
fi

cp "${SOURCE_CONFIG}" "${TARGET_CONFIG}"
echo "Reset LLC site config to generic example at ${TARGET_CONFIG}"
