#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

vagrant box add http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/dev_ppm

DEV_PPM_DIR="$SRC_DIR/dev_ppm"

[ -d "$DEV_PPM_DIR" ] && rm -rf "$DEV_PPM_DIR"
mkdir -p "$DEV_PPM_DIR"
cd "$DEV_PPM_DIR"
[ -f "$DEV_PPM_DIR/Vagrantfile" ] || cp "$DIR/Vagrantfile" "$DEV_PPM_DIR/Vagrantfile"
vagrant up
