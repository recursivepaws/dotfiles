#!/bin/bash
set -o errexit
if [ ${EUID} != 0 ]; then
	echo "This script needs to be run as root"
	exit 1
fi

# Install zsh
dnf install -y git zsh
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Update the default shell
chsh -s $(which zsh)
# Exit new shell
$(exit)
