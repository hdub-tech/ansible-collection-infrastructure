#!/bin/bash

set -e

CURRENT_RELEASE=$1
PREVIOUS_RELEASE=$2
SCRIPT_DIR="$( cd "$( dirname "${0}" )" && pwd )"
PROJECT_DIR="$( cd "${SCRIPT_DIR}/../../" && pwd )"

sed -i "s/\(version: \)${PREVIOUS_RELEASE}/\1${CURRENT_RELEASE}/" "${PROJECT_DIR}/galaxy.yml" "${PROJECT_DIR}/README.md"

sed -i "s/{{ NEXT_RELEASE }}/${CURRENT_RELEASE}/" "${PROJECT_DIR}/CHANGELOG.md"
