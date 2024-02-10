#!/bin/bash

# This script backups all Podman appdata

# Set today's date
backupDate=$(date  +'%F')

# Backup files into tar.gz archive
# I keep config and data of Podman containers in home directory
# I exclude ipc-socket from qBittorrent data directory
tar --exclude ipc-socket -czf <home_dir>/podman-backups/podman-backup-$backupDate.tar.gz <home_dir>/podman

# Move Podman backup archives to an external hard drive/NFS share
mv <home_dir>/podman-backups/podman-backup-$backupDate.tar.gz /mnt/media/podman_backups/
