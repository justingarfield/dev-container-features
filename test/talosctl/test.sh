#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "talosctl" talosctl version --client

# Report result
reportResults
