#!/bin/sh
set -e

echo "Activating feature 'yq'"

# See: https://github.com/mikefarah/yq/releases
OS=linux
ARCH=amd64
curl -L --fail --remote-name-all "https://github.com/mikefarah/yq/releases/download/v${VERSION}/yq_${OS}_${ARCH}"
curl -L --fail --remote-name-all "https://github.com/mikefarah/yq/releases/download/v${VERSION}/checksums"
sha256sum yq_${OS}_${ARCH} | sha256sum --check

# Install binary
install -m 555 yq_${OS}_${ARCH} /usr/local/bin/yq
rm yq_${OS}_${ARCH} checksums
