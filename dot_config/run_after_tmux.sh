#!/bin/bash
set -euo pipefail

TPM_DIR="${HOME}/.local/share/tmux/plugins/tpm"

# Create directory if it doesn't exist
mkdir -p "$(dirname "$TPM_DIR")"

# Clone TPM if it doesn't exist, otherwise update it
if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm.git "$TPM_DIR"
else
  cd "$TPM_DIR" && git pull origin master
fi

echo "TPM installed"
