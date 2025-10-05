#!/bin/bash

set -ouex pipefail

# systemd units
systemctl enable podman.socket
systemctl enable check-sb-key.service

# replace fedora flatpaks with flathub
systemctl enable flatpak-add-flathub-repo.service
systemctl enable flatpak-replace-fedora-apps.service
systemctl enable flatpak-cleanup.timer

