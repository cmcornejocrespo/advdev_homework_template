#!/bin/bash
# Setup Nexus Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Setting up Nexus in project $GUID-sonarqube"

oc project ${GUID}-sonarqube
oc delete all --all
oc delete pvc sonarqube-pvc postgresql