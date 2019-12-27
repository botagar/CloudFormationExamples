#!/bin/bash

DOWNLOAD_URL=$(curl -Ls "https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest" | jq -r .tarball_url)
DOWNLOAD_VERSION=$(grep -o '[^/v]*$' <<< $DOWNLOAD_URL)
if [ ! -f /tmp/metrics-server-$DOWNLOAD_VERSION.tar.gz ]
then
    echo Downloading /tmp/metrics-server-$DOWNLOAD_VERSION.tar.gz from $DOWNLOAD_URL
    curl -Ls $DOWNLOAD_URL -o /tmp/metrics-server-$DOWNLOAD_VERSION.tar.gz
    mkdir /tmp/metrics-server-$DOWNLOAD_VERSION
    tar -xzf /tmp/metrics-server-$DOWNLOAD_VERSION.tar.gz --directory /tmp/metrics-server-$DOWNLOAD_VERSION --strip-components 1
else
    echo /tmp/metrics-server-$DOWNLOAD_VERSION.tar.gz already downloaded... proceeding with pod installations
fi
kubectl apply -f /tmp/metrics-server-$DOWNLOAD_VERSION/deploy/1.8+/
