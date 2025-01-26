#!/bin/sh
set -e

echo "Activating feature 'crane'"

# See: https://github.com/google/go-containerregistry/tree/main/cmd/crane
OS=Linux       # or Darwin, Windows
ARCH=x86_64    # or arm64, x86_64, armv6, i386, s390x
curl -L --fail --remote-name-all "https://github.com/google/go-containerregistry/releases/download/v${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz"
curl -L --fail --remote-name-all "https://github.com/google/go-containerregistry/releases/download/v${VERSION}/checksums.txt"
sha256sum go-containerregistry_${OS}_${ARCH}.tar.gz | sha256sum --check

# (NO LONGER USED IN NEWER RELEASES) Install SLSA Verifier
# See: https://github.com/slsa-framework/slsa-verifier?tab=readme-ov-file#download-the-binary
#OS=linux
#ARCH=amd64
#SLSA_VERIFIER_VERSION=2.6.0
#curl -sL "https://github.com/slsa-framework/slsa-verifier/releases/download/v${SLSA_VERIFIER_VERSION}/slsa-verifier-${OS}-${ARCH}"
#curl -sL https://raw.githubusercontent.com/slsa-framework/slsa-verifier/refs/heads/main/SHA256SUM.md

# Verify SLSA 3 provenance signature
#curl -sL https://github.com/google/go-containerregistry/releases/download/v${VERSION}/multiple.intoto.jsonl > provenance.intoto.jsonl
#chmod +x slsa-verifier-linux-amd64
#slsa-verifier-linux-amd64 verify-artifact go-containerregistry.tar.gz --provenance-path provenance.intoto.jsonl --source-uri github.com/google/go-containerregistry --source-tag "v${VERSION}"

# Install binary
tar -zxvf go-containerregistry_${OS}_${ARCH}.tar.gz -C /usr/local/bin/ crane
rm go-containerregistry_${OS}_${ARCH}.tar.gz checksums.txt
