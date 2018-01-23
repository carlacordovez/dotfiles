#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! vagrant box list | grep -q c1022 ; then
  VAGRANT_BOX_URL="http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/c1022"
  if [ -z "$VAGRANT_LOCAL_BOX_PATH" ] || [ -z "$VAGRANT_LOCAL_BOX_VERSION" ]; then
  	echo "adding vagrant box..."
  	vagrant box add $VAGRANT_BOX_URL
  else
  	echo "adding vagrant box from local path..."
  	vagrant box add c1022 "$VAGRANT_LOCAL_BOX_PATH"
  fi
fi

COGNOS_VM_DIR="$SRC_DIR/c1022"

mkdir -p "$COGNOS_VM_DIR"

echo "copying Vagrantfile..."
cp -fv "$DIR/Vagrantfile" "$COGNOS_VM_DIR/Vagrantfile"

echo "checking vagrant id"
if [ 1 == $(vboxmanage list vms | grep -c "c1022") ] ; then
    vmid="$( VBoxManage list vms | awk '/c1022/ { print substr($2, 2, 36) }' )"
    echo "$vmid" > "$COGNOS_VM_DIR/.vagrant/machines/default/virtualbox/id"
fi

echo "running vagrant up..."
cd "$COGNOS_VM_DIR"
vagrant up

echo "configure network adapters..."
vboxmanage controlvm c1022 nic1 natnetwork NatNetwork
vboxmanage controlvm c1022 nic2 hostonly vboxnet0
