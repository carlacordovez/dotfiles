#!/usr/bin/env bash
set -e

sudo hostess add cognosvm.daptiv.com $COGNOS_VM_IP
sudo hostess add mycognos10vm.hq.daptiv.com $COGNOS_VM_IP

