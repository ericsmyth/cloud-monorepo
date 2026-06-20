#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_CONFIG="${REPO_ROOT}/config/llc-site/prod/config.json"
TARGET_CONFIG="${REPO_ROOT}/apps/llc-site/public/config.json"

if [[ ! -f "${SOURCE_CONFIG}" ]]; then
  echo "Missing source config: ${SOURCE_CONFIG}" >&2
  echo "Create it from config/llc-site/config.example.json first." >&2
  exit 1
fi

cp "${SOURCE_CONFIG}" "${TARGET_CONFIG}"
echo "Copied LLC site config to ${TARGET_CONFIG}"
