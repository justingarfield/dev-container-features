#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "cilium" cilium version --client

# Report result
reportResults
