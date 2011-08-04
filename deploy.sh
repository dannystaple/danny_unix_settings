#!/bin/bash
#Run in the tools dir. Deploys the new settings on a target machine
ln -s `pwd`/.emacs ~/.emacs || true
ln -s `pwd`/python_check_and_tests.sh ~/python_check_and_tests.sh || true
