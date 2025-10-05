#!/bin/bash

set -ouex pipefail

# Copy fsroot/ to /
rsync -rvK /ctx/fsroot/ /

chmod +x /ctx/*.sh

/ctx/01-copr.sh
/ctx/02-packages.sh
/ctx/03-mods.sh
/ctx/04-systemd.sh
/ctx/05-cleanup.sh
