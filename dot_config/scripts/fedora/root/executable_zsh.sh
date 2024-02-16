#!/bin/bash
set -o errexit
if [ ${EUID} != 0 ]; then
	echo "This script needs to be run as root"
	exit 1
fi

# Install zsh
dnf install -y zsh
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Exit new shell
$(exit)
