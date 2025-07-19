#!/bin/bash
source /dev/stdin <<<$(curl -fsSL https://raw.githubusercontent.com/1xtier/lib_script/refs/heads/main/lib.sh)
USERS=1xtier
KEYLOAD=$(curl -s https://api.github.com/users/$USERS/keys | grep -w "key" | sed 's/[":,]//g' | sed 's/key//g' | sed '/^[[:space:]]*$/d')
PATH_KEY=$HOME/.ssh/authorized_keys
SSHDIR=$HOME/.ssh
function add_keys(){
if [ -d $SSHDIR ]; then
   echo "$SSHDIR The directory exists"
   chmod 700 $SSHDIR
else
   echo "$SSHDIR The directory does not exist"
   echo "Creating $SSHDIR"
   mkdir $SSHDIR && chmod 700 $SSHDIR
fi


if [ -e $PATH_KEY ]; then
   echo "$KEYLOAD 1xtier:key #load github key" >> $PATH_KEY && chmod 600 $PATH_KEY
   sed -i 's/^[ \t]*//'  $PATH_KEY
else
   touch $PATH_KEY
   echo "$KEYLOAD 1xtier:key #load github key" > $PATH_KEY && chmod 600 $PATH_KEY
   sed -i 's/^[ \t]*//'  $PATH_KEY
fi
}
function check_os(){
CHECK_SYSTEM=$(ls /usr/bin | grep -w "dnf" | awk 'NR<2')
if [ "$CHECK_SYSTEM" == "dnf" ]; then
  rpm_base
  dnf install -y openssh-server
  systemctl enable --now sshd
  add_keys
else
  CHECK_SYSTEM=$(ls /usr/bin | grep -w "apt" | awk 'NR<2')
  if [ "$CHECK_SYSTEM" == "apt" ]; then
    deb_base
    apt install openssh-server -y
    systemctl enable --now ssh
    add_keys
  else
    echo "Xm-XM"
  fi
fi
}
check_os
