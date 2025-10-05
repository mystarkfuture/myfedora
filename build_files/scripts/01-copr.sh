#!/bin/bash

set -ouex pipefail

dnf5 -y install 'dnf5-command(copr)'

dnf5 -y copr enable pgdev/ghostty 
dnf5 -y copr enable robot/veracrypt
dnf5 -y copr enable ublue-os/staging
