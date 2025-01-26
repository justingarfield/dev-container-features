#!/bin/sh
set -e

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

export DEBIAN_FRONTEND=noninteractive

check_packages curl ca-certificates

echo "Activating feature 'CloudFlare cfssl CLI binary suite'"

# See: https://github.com/cloudflare/cfssl/releases

# cfssl-bundle
curl -sSL -o cfssl-bundle_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/cfssl-bundle_${VERSION}_linux_amd64"
install -m 555 cfssl-bundle_${VERSION}_linux_amd64 /usr/local/bin/cfssl-bundle
rm cfssl-bundle_${VERSION}_linux_amd64

# cfssl-certinfo
curl -sSL -o cfssl-certinfo_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/cfssl-certinfo_${VERSION}_linux_amd64"
install -m 555 cfssl-certinfo_${VERSION}_linux_amd64 /usr/local/bin/cfssl-certinfo
rm cfssl-certinfo_${VERSION}_linux_amd64

# cfssl-newkey
curl -sSL -o cfssl-newkey_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/cfssl-newkey_${VERSION}_linux_amd64"
install -m 555 cfssl-newkey_${VERSION}_linux_amd64 /usr/local/bin/cfssl-newkey
rm cfssl-newkey_${VERSION}_linux_amd64

# cfssl-scan
curl -sSL -o cfssl-scan_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/cfssl-scan_${VERSION}_linux_amd64"
install -m 555 cfssl-scan_${VERSION}_linux_amd64 /usr/local/bin/cfssl-scan
rm cfssl-scan_${VERSION}_linux_amd64

# cfssljson
curl -sSL -o cfssljson_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/cfssljson_${VERSION}_linux_amd64"
install -m 555 cfssljson_${VERSION}_linux_amd64 /usr/local/bin/cfssljson
rm cfssljson_${VERSION}_linux_amd64

# cfssl
curl -sSL -o cfssl_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/cfssl_${VERSION}_linux_amd64"
install -m 555 cfssl_${VERSION}_linux_amd64 /usr/local/bin/cfssl
rm cfssl_${VERSION}_linux_amd64

# mkbundle
curl -sSL -o mkbundle_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/mkbundle_${VERSION}_linux_amd64"
install -m 555 mkbundle_${VERSION}_linux_amd64 /usr/local/bin/mkbundle
rm mkbundle_${VERSION}_linux_amd64

# multirootca
curl -sSL -o multirootca_${VERSION}_linux_amd64 "https://github.com/cloudflare/cfssl/releases/download/v${VERSION}/multirootca_${VERSION}_linux_amd64"
install -m 555 multirootca_${VERSION}_linux_amd64 /usr/local/bin/multirootca
rm multirootca_${VERSION}_linux_amd64
