#!/bin/bash
# This script backups all Podman appdata

# Set backup dates
backupDate=$(date  +'%F')

# External drive location
EXT_DRIVE="/mnt/some/path"

# Home directory location
HOME_DIR="/home/myuser"

# Backup files into tar.gz archive
tar --exclude ipc-socket -czf $HOME_DIR/podman-backups/podman-backup-$backupDate.tar.gz $HOME_DIR/podman

# Move Podman backup archive to external hard drive
mv $HOME/podman-backups/podman-backup-$backupDate.tar.gz $EXT_DRIVE/podman_backups/