#!/bin/bash
# Setup Production Project (initial active services: Green)
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Setting up Parks Production Environment in project ${GUID}-parks-prod"

# Code to set up the parks production project. It will need a StatefulSet MongoDB, and two applications each (Blue/Green) for NationalParks, MLBParks and Parksmap.
# The Green services/routes need to be active initially to guarantee a successful grading pipeline run.

# To be Implemented by Student

oc project ${GUID}-parks-prod

oc new-app -f ../templates/parks-prod.yaml
#Set up the correct permissions for Jenkins to manipulate objects in the production project.
oc policy add-role-to-user edit system:serviceaccount:${GUID}-jenkins:jenkins
#Set up the correct permissions for the production project to deploy images from the development project
oc policy add-role-to-group system:image-puller system:serviceaccounts:${GUID}-parks-prod -n ${GUID}-parks-dev