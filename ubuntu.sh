#!/bin/bash
set -eux

#
# configure APT to use our cache APT proxy.
# see http://10.10.10.3:3142

echo 'Acquire::http::Proxy "http://10.10.10.3:3142";' >/etc/apt/apt.conf.d/00aptproxy


#
# use APT to see it using our APT proxy. 

echo 'Defaults env_keep += "DEBIAN_FRONTEND"' >/etc/sudoers.d/env_keep_apt
chmod 440 /etc/sudoers.d/env_keep_apt
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y


#
# provision other packages to further see the APT cache proxy working.

apt-get install -y vim
apt-get install -y golang
apt-get install -y nginx
