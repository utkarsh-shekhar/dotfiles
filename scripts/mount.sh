#!/usr/bin/bash

mkdir -p /mnt/sd1
sudo mount -o rw,users,umask=000,exec /dev/sda1 /mnt/sd1
