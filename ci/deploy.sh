#!/usr/bin/env bash

set -e
set -u

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd -P)"
cd "${REPO_ROOT}"

current_bucket="$(ci/bucket.sh)"
echo "Pushing to bucket: ${current_bucket}"
s3cmd sync --delete-removed -r -P build/ "${current_bucket}"