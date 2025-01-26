#!/bin/sh
set -e

echo "Activating feature 'opentofu'"

# See:
#!/bin/sh
set -e

echo "Activating feature 'yq'"

# See: https://github.com/mikefarah/yq/releases
OS=linux
ARCH=amd64
curl -L --fail --remote-name-all "https://github.com/opentofu/opentofu/releases/download/v${VERSION}/tofu_${VERSION}_${OS}_${ARCH}.tar.gz"
curl -L --fail --remote-name-all https://github.com/opentofu/opentofu/releases/download/v${VERSION}/tofu_${VERSION}_SHA256SUMS
sha256sum tofu_${VERSION}_${OS}_${ARCH}.tar.gz | sha256sum --check

# Install binary
tar -xzvf tofu_${VERSION}_${OS}_${ARCH}.tar.gz tofu
install -m 555 tofu /usr/local/bin/tofu
rm tofu_${VERSION}_${OS}_${ARCH}.tar.gz tofu_${VERSION}_SHA256SUMS
