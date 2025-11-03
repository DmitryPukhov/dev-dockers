#! /bin/bash

yum install -y python3-devel
yum install -y python3-pip

yum install -y epel-release
yum install -y emacs-nox net-tools openssh-server openssh-clients passwd iproute procps vim go

pip3 install psutil==5.7.0

