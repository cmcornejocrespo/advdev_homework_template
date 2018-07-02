#!/bin/bash
# Setup Nexus Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Cleaning up project $GUID-nexus"

oc project ${GUID}-nexus
oc delete all --all
oc delete pvc nexus-pvc