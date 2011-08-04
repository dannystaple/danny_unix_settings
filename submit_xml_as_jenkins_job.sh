#!/bin/bash
#Needs settings in env
#JENKINS_URL
#JENKINS_USERNAME
#JENKINS_PASSWORD
#Pipe the config xml into this
#Only 1 param - the job name
function submit_xml_as_jenkins_job()
{
    set -eu
    JOB_NAME=$1
    #Download jenkins cli into tmp
    mkdir -p /tmp/jenkins
    pushd /tmp/jenkins
    wget ${JENKINS_URL}/jnlpJars/jenkins-cli.jar
    popd
    #now run the cli
    java -jar /tmp/jenkins/jenkins-cli.jar -s ${JENKINS_URL} create-job --username ${JENKINS_USERNAME} --password ${JENKINS_PASSWORD} ${JOB_NAME}
}

#TODO - support hudson as well

submit_xml_as_jenkins_job $1