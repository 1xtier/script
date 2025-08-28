#!/bin/bash
check=$(ls /usr/sbin/sshd)
function check-os(){
CHECK_SYSTEM=$(ls /usr/bin | grep -w "dnf" | awk 'NR<2')
if [ "$CHECK_SYSTEM" == "dnf" ]; then
  dnf install -y openssh-server
  systemctl enable --now sshd
else
  CHECK_SYSTEM=$(ls /usr/bin | grep -w "apt" | awk 'NR<2')
  if [ "$CHECK_SYSTEM" == "apt" ]; then
    apt install openssh-server -y
    systemctl enable --now ssh
  else
    echo "Xm-XM"
  fi
fi
}
if [ "$check" ==  "/usr/sbin/sshd" ]; then
    if pidof -x sshd >> /dev/null
    then
          echo "Runnig"
    else
        echo "stopped"
        systemctl start sshd
    fi
else
   check-os
fi
