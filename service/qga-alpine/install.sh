#!/bin/sh

function install_qga() {
  /usr/bin/wget http://dl-cdn.alpinelinux.org/alpine/v3.22/community/x86_64/qemu-guest-agent-10.0.0-r1.apk
  /sbin/apk add ./qemu-guest-agent-10.0.0-r1.apk
}

install_qga
