#!/usr/bin/env bash
set -euo pipefail

mode="${1:-both}"
case "$mode" in
  codex|claude|both) ;;
  *) echo "Usage: ./install.sh [codex|claude|both]" >&2; exit 2 ;;
esac

package_dir="$(cd "$(dirname "$0")" && pwd)"
stamp="$(date +%Y%m%d-%H%M%S)"

install_for() {
  target_root="$1"
  mkdir -p "$target_root"
  for skill_name in brd-create brd-help; do
    source_dir="$package_dir/skills/$skill_name"
    target_dir="$target_root/$skill_name"
    if [ -e "$target_dir" ]; then
      backup_dir="${target_dir}.backup-${stamp}"
      mv "$target_dir" "$backup_dir"
      echo "Backed up: $backup_dir"
    fi
    cp -R "$source_dir" "$target_dir"
    echo "Installed: $target_dir"
  done
}

if [ "$mode" = "codex" ] || [ "$mode" = "both" ]; then
  install_for "${CODEX_HOME:-$HOME/.codex}/skills"
fi

if [ "$mode" = "claude" ] || [ "$mode" = "both" ]; then
  install_for "$HOME/.claude/skills"
fi

echo "Done. Start a new Codex task or run /reload-skills in Claude Code."
