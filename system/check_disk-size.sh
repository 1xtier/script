#!/bin/bash
G="\e[32m"
R="\e[31m"
O="\e[0m"
HOMEDIR="/home/"
VARDIR="/var"
DIRBOOT=$(findmnt -o SOURCE -n /)
set -e
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi
echo -e "${R} Check size disk $HOSTNAME ${O}"
echo -e "${G} Check ${R} HOME ${O} ${G} dir ${O}"
du -ahx ${HOMEDIR} | sort -rh | head -5
echo -e "${G} Check ${R}VAR ${O} ${G} dir ${O}"
du -ahx ${VARDIR} | sort -rh | head -10
echo -e "${G} Check  ${R} DISK ${O} ${G} size ${O} "
df -h ${DIRBOOT}

if [ ! -x /var/lib/docker ]; then
        echo -e "${G} There is no docker in the system ${O}"
else
        echo -e "${R} Log files size docker container ${O}"
        du -ahx /var/lib/docker/containers | sort -rh | head -10
fi
