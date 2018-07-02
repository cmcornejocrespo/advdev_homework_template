#!/bin/bash
# Setup Jenkins Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Cleaning up ${GUID}-parks-prod"

oc project ${GUID}-parks-prod
oc delete all --all
oc delete pvc mongo-data-mongodb-0 mongo-data-mongodb-1 mongo-data-mongodb-2