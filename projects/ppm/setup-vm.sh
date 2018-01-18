#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "adding shared folder NEED TO REMOVE REQUIREMENT IN ORIGINAL DEV_BOX"
mkdir -p "$SRC_DIR/our-boxen"

echo "checking virtualbox networks..."
if ! VBoxManage natnetwork list | grep -q -E 'Name: +NatNetwork$' ; then
    echo "setting up virtualbox nat network"
    vboxmanage natnetwork add --netname NatNetwork --network 10.0.2.0/24 --ipv6 off --enable
    vboxmanage natnetwork start --netname NatNetwork
fi

if ! vagrant box list | grep -q dev_ppm ; then
  VAGRANT_BOX_URL="http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/dev_ppm"
  if [ -z "$VAGRANT_LOCAL_BOX_PATH" ] || [ -z "$VAGRANT_LOCAL_BOX_VERSION" ]; then
    echo "adding vagrant box..."
    vagrant box add $VAGRANT_BOX_URL
  else
    echo "adding vagrant box from local path..."
    vagrant box add dev_ppm "$VAGRANT_LOCAL_BOX_PATH"
    mv ~/.vagrant.d/boxes/dev_ppm/0 ~/.vagrant.d/boxes/dev_ppm/$VAGRANT_LOCAL_BOX_VERSION
    echo -n "$VAGRANT_BOX_URL" > ~/.vagrant.d/boxes/dev_ppm/metadata_url
  fi
fi

DEV_PPM_DIR="$SRC_DIR/dev_ppm"

mkdir -p "$DEV_PPM_DIR"

echo "copying Vagrantfile..."
cp -fv "$DIR/Vagrantfile" "$DEV_PPM_DIR/Vagrantfile"

echo "checking vagrant id"
if [ 1 == $(vboxmanage list vms | grep -c "dev_ppm") ] ; then
    vmid="$( VBoxManage list vms | awk '/dev_ppm/ { print substr($2, 2, 36) }' )"
    echo "$vmid" > "$DEV_PPM_DIR/.vagrant/machines/default/virtualbox/id"
fi

echo "running vagrant up..."
cd "$DEV_PPM_DIR"
vagrant up

echo "set network adapter 1 to natnetwork..."
vmid="$( VBoxManage list vms | awk '/dev_ppm/ { print substr($2, 2, 36) }' )"
vboxmanage controlvm $vmid nic1 natnetwork NatNetwork
