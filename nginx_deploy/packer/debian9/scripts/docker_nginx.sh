#!/bin/bash -eux

# Install docker-ce dependencies.
apt -y update && apt-get -y upgrade
apt -y install python python-pip python-dev apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

