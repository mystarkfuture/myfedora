#!/bin/bash

set -ouex pipefail

dnf5 install -y rsync

# Copy fsroot/ to /
rsync -rvK /ctx/fsroot/ /

cp /ctx/scripts /tmp/ctx/scripts
chmod -x /tmp/ctx/scripts/*

/tmp/ctx/scripts/01-copr.sh
/tmp/ctx/scripts/02-packages.sh
/tmp/ctx/scripts/03-mods.sh
/tmp/ctx/scripts/04-systemd.sh
/tmp/ctx/scripts/05-cleanup.sh
