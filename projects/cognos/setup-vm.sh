#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! vagrant box list | grep -q c1022 ; then
  echo "adding vagrant box..."
  vagrant box add http://artrepo.daptiv.com:8081/artifactory/api/vagrant/vagrant-local/c1022
fi

CGNOS_VM_DIR="$SRC_DIR/c1022"

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
