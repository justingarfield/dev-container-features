#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

check "ffmpeg" ffmpeg -version

# Report result
reportResults
