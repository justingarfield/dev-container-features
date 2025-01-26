#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "opentofu" tofu --version

# Report result
reportResults
