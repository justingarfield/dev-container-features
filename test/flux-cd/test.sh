#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "flux-cd" flux --version

# Report result
reportResults
