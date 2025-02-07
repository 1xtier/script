#!/usr/bin/env bash 
USER=
PORT=
PATH_ANSIBLE=
SSH_KEY=
nmap -v -sn -n $1 -oG - | awk '/Status: Up/{print $2}' >> ./temp_scan.txt
for srv in $(cat temp_scan.txt)
do
NAME_HOST=$(ssh -i ${SSH_KEY} ${USER}@$srv 'hostname')
cat << EOF >> ${PATH_ANSIBLE}/inventory
${NAME_HOST} ansible_ssh_host=${srv} ansible_port=${PORT}
EOF
done
rm -rf $PWD/temp_scan.txt
