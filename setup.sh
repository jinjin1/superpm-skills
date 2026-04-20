#!/usr/bin/env bash
# SuperPM Skills installer
# Copies this repo's Role/Scenario skills into ~/.claude/skills/superpm/
# so Claude Code can auto-load them.

set -euo pipefail

TARGET="${HOME}/.claude/skills/superpm"
SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Checks ---

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required but not installed."
  echo "Install git first: https://git-scm.com/downloads"
  exit 1
fi

if [ ! -f "${SOURCE}/ETHOS.md" ] || [ ! -d "${SOURCE}/roles" ]; then
  echo "Error: run ./setup.sh from the superpm-skills repo root."
  echo "Expected to find ETHOS.md and roles/ in: ${SOURCE}"
  exit 1
fi

# Ensure Claude Code skills dir exists and is writable
mkdir -p "$(dirname "${TARGET}")" 2>/dev/null || {
  echo "Error: cannot create $(dirname "${TARGET}"). Check permissions."
  exit 1
}

# --- Handle existing install ---

if [ -d "${TARGET}" ]; then
  echo "Existing install found at: ${TARGET}"
  printf "Overwrite? This will remove the old install. [y/N] "
  read -r reply
  case "${reply}" in
    [Yy]|[Yy][Ee][Ss])
      rm -rf "${TARGET}"
      ;;
    *)
      echo "Aborted. No changes made."
      exit 0
      ;;
  esac
fi

# --- Copy ---

# Use rsync if available (preserves perms cleanly), fall back to cp -R
if command -v rsync >/dev/null 2>&1; then
  rsync -a --exclude='.git' --exclude='node_modules' --exclude='.DS_Store' \
    "${SOURCE}/" "${TARGET}/"
else
  mkdir -p "${TARGET}"
  cp -R "${SOURCE}/"* "${TARGET}/"
  rm -rf "${TARGET}/.git" "${TARGET}/node_modules" 2>/dev/null || true
fi

# --- Verify ---

if [ ! -f "${TARGET}/ETHOS.md" ]; then
  echo "Error: copy appears incomplete. ETHOS.md missing at target."
  exit 1
fi

ROLE_COUNT=$(find "${TARGET}/roles" -name 'SKILL.md' 2>/dev/null | wc -l | tr -d ' ')
SCENARIO_COUNT=$(find "${TARGET}/scenarios" -name 'SKILL.md' 2>/dev/null | wc -l | tr -d ' ')

echo ""
echo "================================================"
echo "  SuperPM Skills installed"
echo "================================================"
echo "  Location: ${TARGET}"
echo "  Roles:     ${ROLE_COUNT}"
echo "  Scenarios: ${SCENARIO_COUNT}"
echo "================================================"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code."
echo "  2. Try: 'PRD 써줘' (invokes pm-writer role)"
echo "  3. Update anytime with: cd ${SOURCE} && git pull && ./setup.sh"
echo ""
