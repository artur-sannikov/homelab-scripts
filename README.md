# Miscellaneous scripts I use to run my self-hosted services

## podman/backup

### Problem

The main issue with backing up Podman appdata when using Quadlets is that first we need to stop all services with `systemctl --user stop <service_name>` which we need to run without sudo; otherwise it will not work.

Then we need to back up all appdata files with `sudo` rights because some files do not have read permission for `others` group.

Finally, we have to start all containers with `systemctl --user start <service_name>` which again must be run without sudo rights.

### Solution

My solution is to use 3 separate scripts: 

1. `stop-podman-services.sh` in `crontab -e` runs every day at 5:00 AM;
2. `backup-podman.sh` in `sudo crontab -e` runs every day at 5:02 AM as root. We have a 2-minute buffer to allow all containers to stop;
3. `start-podman-services.sh` in `crontab -e` runs every day at 5:06 AM. We give 4 minutes of buffer to allow `tar` to finish its job. This buffer should be adjusted if there are many services.

The solution is not ideal in my opinion. I would prefer to run all the commands in one script. One solution is to allow a script that requires `sudo` rights to be run as a non-root user with `sudo` rights *without* requiring a `sudo` password, which poses a security risk if for any reason that script is modified for nefarious purposes.