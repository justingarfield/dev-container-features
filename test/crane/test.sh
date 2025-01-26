#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "crane" crane version

# Report result
reportResults
