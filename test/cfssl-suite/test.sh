#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "cfssl" cfssl version

# Report result
reportResults
