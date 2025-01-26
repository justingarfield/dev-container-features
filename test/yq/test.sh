#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "yq" yq --version

# Report result
reportResults
