#!/bin/bash
curl -fsSL https://download.opensuse.org/repositories/home:hawkeye116477:waterfox/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_hawkeye116477_waterfox.gpg > /dev/null
echo 'deb https://download.opensuse.org/repositories/home:/hawkeye116477:/waterfox/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/home:hawkeye116477:waterfox.list
