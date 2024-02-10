#!/bin/bash

# Stop services (add more if needed)
systemctl --user stop freshrss.service
systemctl --user stop actual.service
systemctl --user stop qbittorrent.service

# Export paperless-ngx media and database before stopping the container
podman exec paperless-ngx document_exporter /usr/src/paperless/export --zip

# Stop paperless-related services
systemctl --user stop paperless.service
systemctl --user stop paperless-postgres.service
systemctl --user stop paperless-redis.service
