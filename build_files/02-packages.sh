#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

io_utils=(
    "wl-clipboard"
    "input-remapper"
    "openssh-askpass" 
    "simple-scan"
    "lm_sensors"
)

system_utils=(
    "distrobox"
    "ulauncher"
    "veracrypt"
    "zoxide"
    "stow"
    "git"
    "zsh"
    "fastfetch"
    "ghostty"
)

gnome_shell_extensions=(
    "gnome-shell-extension-system-monitor"
    "gnome-shell-extension-appindicator"
    "gnome-shell-extension-blur-my-shell"
    "gnome-shell-extension-caffeine"
    "gnome-shell-extension-places-menu"
)

development_utils=(
    "git-credential-libsecret"
    "code"
    "python3-pip"
    "gcc"
    "g++"
    "make"
    "automake"
    "autoconf"
    "glibc-devel"
    "libstdc++-devel"
    "binutils"
    "kernel-devel"
)

packages=(
  ${io_utils[@]}
  ${system_utils[@]}
  ${gnome_shell_extensions[@]}
  ${development_utils[@]}
)

# install rpms
dnf5 install -y ${packages[@]}