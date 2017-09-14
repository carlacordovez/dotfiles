#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "adding shared folder NEED TO REMOVE REQUIREMENT IN ORIGINAL DEV_BOX"
mkdir -p "$SRC_DIR/our-boxen"

if ! vagrant box list | grep -q dev_ppm ; then
  echo "adding vagrant box..."
  vagrant box add http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/dev_ppm
fi

DEV_PPM_DIR="$SRC_DIR/dev_ppm"

mkdir -p "$DEV_PPM_DIR"

echo "copying Vagrantfile..."
cp -fv "$DIR/Vagrantfile" "$DEV_PPM_DIR/Vagrantfile"

echo "checking vagrant id"
if [ 1 == $(vboxmanage list vms | grep -c "dev_ppm") ] ; then
	vboxmanage showvminfo "dev_ppm" --machinereadable | egrep "UUID=" | cut -b 7-42 > "$DEV_PPM_DIR/.vagrant/machines/default/virtualbox/id"
fi

echo "running vagrant up..."
cd "$DEV_PPM_DIR"
vagrant up
