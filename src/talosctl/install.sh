#!/bin/sh
set -e

echo "Activating feature 'talosctl'"

# See: https://github.com/siderolabs/talos/releases
OS=linux
ARCH=amd64
curl -L --fail --remote-name-all "https://github.com/siderolabs/talos/releases/download/v${VERSION}/talosctl-${OS}-${ARCH}"
curl -L --fail --remote-name-all "https://github.com/siderolabs/talos/releases/download/v${VERSION}/sha256sum.txt"
sha256sum talosctl-${OS}-${ARCH} | sha256sum --check

# Install binary
install -m 555 talosctl-${OS}-${ARCH} /usr/local/bin/talosctl
rm talosctl-${OS}-${ARCH} sha256sum.txt
