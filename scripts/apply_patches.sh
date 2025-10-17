#!/bin/bash
set -e
repo_url=${1:-https://github.com/qbittorrent/qBittorrent}
git clone $repo_url src
cd src
git checkout main
git apply ../patches/*.patch
mkdir build && cd build
cmake .. && make -j$(nproc)
