#!/bin/bash
# Publish dotfiles to Atlassian devenv (S3)
# Run this after making changes to keep your devbox in sync.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Publishing dotfiles to atlas devenv..."
mkdir -p ~/tmp/dotfiles
atlas devenv dotfiles upload --path "$SCRIPT_DIR" --force-sync
echo "==> ✓ Dotfiles published"
echo ""
echo "Your devbox will use the updated setup on next provision,"
echo "or immediately if --force-sync triggered a sync."
