#!/bin/bash
set -eu
test=$1
pushd `dirname $test`
pylint --errors-only --output-format=parseable *.py
echo "No pylint errors found..."
if [[ $test =~ test.*\.py ]]; then
    echo "Tests found.. testing..."
    python $test
    echo "Testing succeeded..."
fi
echo "Warnings and lint..."
pylint --output-format=parseable --disable=C0301,C0103 *.py
