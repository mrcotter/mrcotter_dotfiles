#!/usr/bin/env bash

if test ! $(which brew)
then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi