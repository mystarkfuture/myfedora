#!/bin/bash

set -ouex pipefail

# Copy fsroot/ to /
rsync -rvK /ctx/fsroot/ /

chmod +x /ctx/scripts/*

/ctx/scripts/01-copr.sh
/ctx/scripts/02-packages.sh
/ctx/scripts/03-mods.sh
/ctx/scripts/04-systemd.sh
/ctx/scripts/05-cleanup.sh
