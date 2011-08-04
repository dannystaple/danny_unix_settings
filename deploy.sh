#!/bin/bash
#Run in the tools dir. Deploys the new settings on a target machine
#rc files
RC_FILES=.emacs

ln -s `pwd`/.emacs ~/.emacs || true

#bin tools
BIN_APPS=python_check_and_tests.sh submit_xml_as_jenkins_job.sh
for APP in ${BIN_APPS}; do
    ln -s `pwd`/${APP} ~/bin/${APP} || true
done

