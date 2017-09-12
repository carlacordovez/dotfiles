#!/usr/bin/env bash
set -e

sudo hostess add localvm.daptiv.com $PPM_DEV_VM_IP
sudo hostess add dev.daptiv.com $PPM_DEV_VM_IP
sudo hostess add devadmin.daptiv.com $PPM_DEV_VM_IP
sudo hostess add devapi.daptiv.com $PPM_DEV_VM_IP
sudo hostess add devauth.daptiv.com $PPM_DEV_VM_IP
sudo hostess add devsso.daptiv.com $PPM_DEV_VM_IP
sudo hostess add devppm.daptiv.com 127.0.0.1
