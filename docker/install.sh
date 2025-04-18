#!/bin/bash

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
systemctl status docker