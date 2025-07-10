#!/bin/bash

set -ouex pipefail

### Install packages

# Add RPM Fusion Nonfree repository for NVIDIA drivers
dnf5 install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Install NVIDIA drivers and akmods
# The akmod-nvidia package will build the kernel modules for your kernel version
dnf5 install -y \
    akmod-nvidia \
    xorg-x11-drv-nvidia-cuda \
    # Add other NVIDIA related packages if needed, e.g., for specific tools
    # xorg-x11-drv-nvidia-libs # This is usually pulled in by xorg-x11-drv-nvidia-cuda
    # libva-nvidia-driver # For VA-API acceleration
    # vdpauinfo # For VDPAU utilities
    # nvidia-settings # For NVIDIA X Server Settings utility
    && \
    # Remove any conflicting Mesa drivers if necessary (though akmod-nvidia usually handles this)
    # rpm-ostree override remove mesa-va-drivers mesa-    # Remove any conflicting Mesa drivers if necessary (though akmod-nvidia usually handles this)
    # rpm-ostree override remove mesa-va-drivers mesa-vdpau-drivers \
    # && \
    # Ensure akmods are built for the current kernel
    # This step is critical for the drivers to functionvdpau-drivers \
    # && \
    # Ensure akmods are built for the current kernel
    # This step is critical for the drivers to function
    /usr/bin/akmods --force --kernels $(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}') --target /usr/lib/modules/$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')/extra

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
