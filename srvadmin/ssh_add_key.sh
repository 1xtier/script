#!/bin/bash
USERS=1xtier
KEYLOAD=$(curl -s https://api.github.com/users/$USERS/keys | grep -w "key" | sed 's/[":,]//g' | sed 's/key//g' | sed '/^[[:space:]]*$/d')
PATH_KEY=/root/.ssh/authorized_keys
SSHDIR=/root/.ssh
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
