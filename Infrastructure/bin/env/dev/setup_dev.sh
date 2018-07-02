#!/bin/bash
# Setup Development Project
if [ "$#" -ne 1 ]; then
    echo "Usage:"
    echo "  $0 GUID"
    exit 1
fi

GUID=$1
echo "Setting up Parks Development Environment in project ${GUID}-parks-dev"

# Code to set up the parks development project.

# To be Implemented by Student

oc project ${GUID}-parks-dev
#Set up a MongoDB database (persistent) in the development project
oc new-app mongodb-persistent
#Set up the correct permissions for Jenkins to manipulate objects in the development project.
oc policy add-role-to-user edit system:serviceaccount:${GUID}-jenkins:jenkins

oc new-build --binary=true --name="mlbparks" jboss-eap70-openshift:1.7
oc new-app ${GUID}-parks-dev/mlbparks:0.0-0 --name=mlbparks --allow-missing-imagestream-tags=true
oc set triggers dc/mlbparks --remove-all
oc expose dc mlbparks --port 8080
oc expose svc mlbparks
#oc create configmap mlbparks-config --from-literal="application-users.properties=Placeholder" --from-literal="application-roles.properties=Placeholder" 
#oc set volume dc/mlbparks --add --name=jboss-config --mount-path=/opt/eap/standalone/configuration/application-users.properties --sub-path=application-users.properties --configmap-name=mlbparks-config
#oc set volume dc/mlbparks --add --name=jboss-config1 --mount-path=/opt/eap/standalone/configuration/application-roles.properties --sub-path=application-roles.properties --configmap-name=mlbparks-config

oc new-build --binary=true --name="nationalparks" redhat-openjdk18-openshift:1.2
oc new-app ${GUID}-parks-dev/nationalparks:0.0-0 --name=nationalparks --allow-missing-imagestream-tags=true
oc set triggers dc/nationalparks --remove-all
oc expose dc nationalparks --port 8080
oc expose svc nationalparks
#oc create configmap nationalparks-config --from-literal="application-users.properties=Placeholder" --from-literal="application-roles.properties=Placeholder" 
#oc set volume dc/nationalparks --add --name=jboss-config --mount-path=/opt/eap/standalone/configuration/application-users.properties --sub-path=application-users.properties --configmap-name=nationalparks-config
#oc set volume dc/nationalparks --add --name=jboss-config1 --mount-path=/opt/eap/standalone/configuration/application-roles.properties --sub-path=application-roles.properties --configmap-name=nationalparks-config

oc new-build --binary=true --name="parksmap" redhat-openjdk18-openshift:1.2
oc new-app ${GUID}-parks-dev/parksmap:0.0-0 --name=parksmap --allow-missing-imagestream-tags=true
oc set triggers dc/parksmap --remove-all
oc expose dc parksmap --port 8080
oc expose svc parksmap
#oc create configmap parksmap-config --from-literal="application-users.properties=Placeholder" --from-literal="application-roles.properties=Placeholder" 
#oc set volume dc/parksmap --add --name=jboss-config --mount-path=/opt/eap/standalone/configuration/application-users.properties --sub-path=application-users.properties --configmap-name=parksmap-config
#oc set volume dc/parksmap --add --name=jboss-config1 --mount-path=/opt/eap/standalone/configuration/application-roles.properties --sub-path=application-roles.properties --configmap-name=parksmap-config


