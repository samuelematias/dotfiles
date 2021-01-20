#!/usr/bin/env bash
set -euo pipefail

echo "ℰ Installing Doom Emacs"
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
echo "✅ Successful installed Doom Emacs"