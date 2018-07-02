#!/bin/bash
# Setup Jenkins Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Cleaning up project $GUID-jenkins"

oc project ${GUID}-jenkins
oc delete all --all
oc delete cm jenkins-agent
oc delete pvc jenkins