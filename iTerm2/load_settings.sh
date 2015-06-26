#!/usr/bin/env bash

# Ask for the administrator password
sudo -v

# Keep-alive: update existing `sudo` time stamp until 'install_powerline.sh' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

SHDIR=$( cd "$( dirname "$0" )" && pwd )
# Copy preference file inside ~/Library/Preferences/ folder
cp -rf $SHDIR/com.googlecode.iterm2.plist ~/Library/Preferences/
# Preferences are cached in 10.9/10.10, the application will keep using the cached version
# Changes made with defaults are applied after you quit and reopen an application
defaults read com.googlecode.iterm2
