#!/bin/sh
set -e

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

export DEBIAN_FRONTEND=noninteractive

check_packages curl ca-certificates xz-utils

echo "Activating feature 'ffmpeg'"

# See: https://github.com/BtbN/FFmpeg-Builds/releases
curl -L --remote-name-all https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}.tar.xz
curl -L --remote-name-all https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/checksums.sha256
sha256sum ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}.tar.xz | sha256sum --check

tar -xJf ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}.tar.xz \
  ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}/bin/ffmpeg \
  ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}/bin/ffplay \
  ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}/bin/ffprobe

install -m 555 ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}/bin/ffmpeg /usr/local/bin/ffmpeg
install -m 555 ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}/bin/ffplay /usr/local/bin/ffplay
install -m 555 ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}/bin/ffprobe /usr/local/bin/ffprobe
rm -Rf ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION} \
  ffmpeg-n${VERSION}-latest-linux64-gpl-${VERSION}.tar.xz \
  checksums.sha256
