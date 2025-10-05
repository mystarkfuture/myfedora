#!/bin/bash

set -ouex pipefail

# Copy fsroot/ to /
rsync -rvK /ctx/fsroot/ /

/ctx/build_files/01-copr.sh
/ctx/build_files/02-packages.sh
/ctx/build_files/03-mods.sh
/ctx/build_files/04-systemd.sh
/ctx/build_files/05-cleanup.sh
