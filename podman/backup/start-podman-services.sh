#!/bin/bash

# This scripts starts all Podman services
systemctl --user start freshrss.service
systemctl --user start actual.service
systemctl --user start qbittorrent.service

systemctl --user start paperless-postgres.service
systemctl --user start paperless-redis.service
systemctl --user start paperless.service
