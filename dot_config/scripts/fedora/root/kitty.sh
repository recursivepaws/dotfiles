#!/bin/bash
set -o errexit
if [ ${EUID} != 0 ]; then
	echo "This script needs to be run as root"
	exit 1
fi

echo "Installing Kitty, Firefox, ..."

# Install
dnf install -y kitty firefox
