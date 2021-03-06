#!/bin/bash -xe

if [[ ! -f .bonnyci/run.sh ]]; then
    echo "ERROR: No test script found at .bonnyci/run.sh, skipping"
    exit 1
elif [[ ! -x .bonnyci/run.sh ]]; then
    echo "ERROR: Test script found at .bonnyci/run.sh but it is not executable"
    exit 1
fi

export BONNYCI_TEST_PIPELINE={pipeline}
export BONNYCI_TEST_LOG_DIR="{{ bonnyci_logs_dir }}"

if ./.bonnyci/run.sh; then
    echo ".bonnyci/run.sh test(s) passed :)"
    exit 0
else
    echo ".bonnyci/run.sh test(s) failed :("
    exit 1
fi
