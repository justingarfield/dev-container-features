#!/bin/bash

set -e

source dev-container-features-test-lib

check "argocd" argocd version --client

reportResults
