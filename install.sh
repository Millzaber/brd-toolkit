#!/usr/bin/env bash
set -euo pipefail

repository_dir="$(cd "$(dirname "$0")" && pwd)"
exec "$repository_dir/plugins/brd-toolkit/install.sh" "${1:-both}"
