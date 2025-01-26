#!/bin/sh
set -e

echo "Activating feature 'tetragon-cli'"

# See: https://tetragon.io/docs/installation/tetra-cli/
OS=linux
ARCH=amd64
curl -L --remote-name-all https://github.com/cilium/tetragon/releases/download/v${VERSION}/tetra-${OS}-${ARCH}.tar.gz{,.sha256sum}
sha256sum --check tetra-${OS}-${ARCH}.tar.gz.sha256sum
tar -C /usr/local/bin -xzvf tetra-${OS}-${ARCH}.tar.gz
rm tetra-${OS}-${ARCH}.tar.gz*
