#!/usr/bin/env bash

# Ask for the administrator password
sudo -v

# Keep-alive: update existing `sudo` time stamp until 'install_powerline.sh' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

SHDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# Install fonts for powerline-shell
echo "Install fonts for powerline-shell"
sh "$SHDIR/fonts/install.sh"

# Install Powerline-shell
echo "Installing and Configuring Powerline-shell"
# Clone from https://github.com/milkbikis/powerline-shell
git clone https://github.com/milkbikis/powerline-shell
# Enter the powerline-shell directory and copy config.py.dist to config.py. Then run the install.py script.
cd powerline-shell
cp config.py.dist config.py
./install.py
# Copy the generated powerline-shell.py to Home directory
cp powerline-shell.py ~/powerline-shell.py

ADDTO_BASHPROFILE ()
{
	{
	echo ""
	echo "function _update_ps1() {"
	echo $'\t'"export PS1=\"\$(~/powerline-shell.py \$? 2> /dev/null)\""
	echo "}"
	echo ""
	echo "export PROMPT_COMMAND=\"_update_ps1; \$PROMPT_COMMAND\""
	}
} >> ~/.bash_profile

# Change / Setup bash custom prompt (PS1) using powerline
if grep -q "powerline-shell.py" ~/.bash_profile
then
	echo "Existing powerline text found in bash_profile, nothing added"
else
	ADDTO_BASHPROFILE
fi

# Clean up the downloaded powerline-shell directory
cd ..; rm -rf -- powerline-shell
echo "Powerline added to shell, please logout or restart"