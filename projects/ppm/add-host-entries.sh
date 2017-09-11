#!/usr/bin/env bash
set -e

sudo hostess update localvm.daptiv.com $PPM_DEV_VM_IP
sudo hostess update dev.daptiv.com $PPM_DEV_VM_IP
sudo hostess update devadmin.daptiv.com $PPM_DEV_VM_IP
sudo hostess update devapi.daptiv.com $PPM_DEV_VM_IP
sudo hostess update devauth.daptiv.com $PPM_DEV_VM_IP
sudo hostess update devsso.daptiv.com $PPM_DEV_VM_IP
sudo hostess update devppm.daptiv.com 127.0.0.1
