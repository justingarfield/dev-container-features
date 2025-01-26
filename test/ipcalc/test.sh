#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "ipcalc" ipcalc --version

# Report result
reportResults
