#!/bin/bash

set -ouex pipefail

dnf5 install -y rsync

# Copy fsroot/ to /
rsync -rvK /ctx/fsroot/ /

cp -r /ctx/scripts /tmp/scripts
chmod -x /tmp/scripts/*

/tmp/scripts/01-copr.sh
/tmp/scripts/02-packages.sh
/tmp/scripts/03-mods.sh
/tmp/scripts/04-systemd.sh
/tmp/scripts/05-cleanup.sh
