#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

MPVDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Install mpv via Homebrew
if test ! $(which mpv); then
	echo "Installing mpv via Homebrew"
	brew install mpv --with-bundle
	brew linkapps mpv
fi

echo ""
echo "Setting up mpv"

# Create .config directory if it does not exist
mkdir -p ~/.config

# Create and sync all necessary directories and files
mkdir -p ~/.config/mpv
mkdir -p ~/.config/mpv/watch_later
rsync --exclude ".DS_Store" --exclude "install.sh" -ravh $MPVDIR ~/.config;

# Set default application using mpv for video play
APPFILE=/Applications/mpv.app

if [ ! -e "$APPFILE" ]; then
   	exit
fi

BUNDLEID=$(mdls -name kMDItemCFBundleIdentifier -r $APPFILE)

EXTS=( 3GP ASF AVI FLV M4V MKV MOV MP4 MPEG MPG MPG2 MPG4 OGM RMVB WMV )

if test ! $(which duti); then
	echo "Installing duti"
	brew install duti
fi

for ext in ${EXTS[@]}
do
	lower=$(echo $ext | awk '{print tolower($0)}')
	duti -s $BUNDLEID $ext all
	duti -s $BUNDLEID $lower all
done