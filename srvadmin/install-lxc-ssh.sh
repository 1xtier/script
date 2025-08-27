#!/bin/bash

function check_os(){
CHECK_SYSTEM=$(ls /usr/bin | grep -w "dnf" | awk 'NR<2')
if [ "$CHECK_SYSTEM" == "dnf" ]; then
  dnf install -y openssh-server
  systemctl enable --now sshd
  add_keys
else
  CHECK_SYSTEM=$(ls /usr/bin | grep -w "apt" | awk 'NR<2')
  if [ "$CHECK_SYSTEM" == "apt" ]; then
    apt install openssh-server -y
    systemctl enable --now ssh
    add_keys
  else
    echo "Xm-XM"
  fi
fi
}
check_os
