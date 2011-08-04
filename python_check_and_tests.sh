#!/bin/bash
set -eu
test=$1
pushd `dirname $test`
pylint --errors-only --output-format=parseable *.py
if [[ $test =~ test.*\.py ]]; then
    python $test
fi
pylint --output-format=parseable --disable=C0301,C0103 *.py
