#!/bin/bash
# Setup Jenkins Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Cleaning up project ${GUID}-parks-dev"

oc project ${GUID}-parks-dev
oc delete all --all