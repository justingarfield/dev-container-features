#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "tetra" tetra version

# Report result
reportResults
