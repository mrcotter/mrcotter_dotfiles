# mrcotter_dotfiles
Configuration dot files for OS X, Homebrew, MPV, etc. For :baby_bottle:**Developers**.

![Screenshot of Terminal](http://i.imgur.com/UZhJURm.png)

`Dotfiles` might be the most important files on any Unix, Linux or Mac system. They **backup**, **restore**, and **sync** the prefs and settings for your system and apps.

It is convenient that adding `dotfiles` to GitHub, and I do encourage you to do the same. Thanks to the community, I learned from some previous works and made my own version within two days.

Well, let's get started and see how to use my `dotfiles`.

## First things first

* Install **[Xcode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)**.
* Install **Command Line Tools** for **[Xcode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)** in Terminal: `xcode-select --install`.
* Install the latest version of **[XQuartz](https://xquartz.macosforge.org)** for your OS. Many projects may require the up-to-date libraries.
* For Java development, Java SE Development Kit is required. You can install both **[Apple's Java 6](https://support.apple.com/kb/DL1572)** and **[Oracle's Java 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)**.

Reminder: Java 6 is now **_deprecated and not supported_**, and the current OS X El Capitan GM has issues installing Java 6 and running application that requires the legacy Java version.

## Download dotfiles

#### - Using Git

You can clone my repository wherever you want (e.g. `~/Documents/dotfiles`). **_Don't_** execute the bootstrap script right now because several settings in my `dotfiles` required some other dependencies. We are gonna install them via **[Homebrew](http://brew.sh/)** in the next step.

```bash
git clone https://github.com/mrcotter/mrcotter_dotfiles.git
```

To update later on, just run the command below in the folder of the repository:

```bash
git pull origin master
```

## Install Homebrew

After that, you may want to install some common **[Homebrew](http://brew.sh/)** formulae as many developers do. **[Homebrew](http://brew.sh/)** helps you to install and manage a host of command-line tools.

```bash
cd homebrew
./brew_install.sh
./brew_recipes.sh
```

In the recipes script, you can simply comment out or delete those fomulae that you don't want to install. But beware, there are also configurations in `dotfiles` that relate to some of them. Make sure you understand the files and edit the fomulae properly. For instance, GNU core utilities, Bash, Ant, Maven and Jenv.

#### - Update Bash Shell

From the recipes, **[Homebrew](http://brew.sh/)** installed Bash 4 to `/usr/local/opt/bash/bin`. Using the following commands, we’ll initiate a shell as the root user, append new shell path to a file of whitelisted system shells, and then change the system shell globally.

```bash
sudo echo /usr/local/opt/bash/bin/bash >> /etc/shells
```

Enter

```bash
chsh
```

Change

```bash
Shell: /bin/bash
```

To

```bash
Shell: /usr/local/opt/bash/bin/bash
```

:wq to save and quit, restart the Terminal and then enter:

```bash
echo $BASH_VERSION
```

The output result should be 4.3.33(1)-release or above. Congratulations! You can now use some new commands in the Terminal, for example:

```bash
echo -e '\e[0;33;1mHello\e[0m World'
```

## Install Dotfiles

To install, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

To update form my repository, simply run the command above again. The bootstrapper script will pull in the latest version and copy the files to your local folder.

#### - About `$PATH`

If there is a need to extend or modify `$PATH`, locate to `~/.path`. This is the one which is sourced along with the other files. Like this:

```bash
sudo nano ~/.path
```

#### - Solarized Theme for iTerm2 / Terminal

I use a custom bash prompt based on the **[Solarized color palette](http://ethanschoonover.com/solarized)**. It's quite common to install **[iTerm2](https://www.iterm2.com/)** (a cool Terminal replacement) and import `Solarized Dark.itermcolors` (The files are in the folder `solarized_theme`, `Solarized Dark xterm-256color.terminal` is for build-in Terminal).

#### - Powerline-shell for Bash

**[Powerline-shell](https://github.com/milkbikis/powerline-shell)** is a python daemon that supplies a consistent, nicely formated status line information that can be used in any terminal shell such as Bash, ZSH and Fish. To install, `cd` into `powerline-shell` directory and then:

```bash
cd powerline-shell
./install.sh
```

The script will do all the jobs, including install the [patched fonts](https://github.com/powerline/fonts). After that, you just need to select one of these fonts in the iTerm2/terminal preferences. Personally, I use the font `Droid Sans Mono for Powerline`.

## Setting up OS X defaults

You may want to set some sensible OS X defaults too:

```bash
cd osx_defaults
./.osx
```

## Install MPV

![MPV Screenshot](http://i.imgur.com/2h7un5l.jpg)

**[MPV](http://mpv.io)** is a fork of mplayer2 and MPlayer. It shares some features with the former projects while introducing many more. I find **[MPV](http://mpv.io)** the best video player so far on Mac for its high quality video output and better support on different formats of subtitles compare to **[Movist](https://itunes.apple.com/au/app/movist/id461788075?mt=12)**.

**[MPV](http://mpv.io)** is essentially a CLI media player for its current progress. It lacks of full GUI mode to control or adjust settings other than the OSC (On Screen Controller). All other settings must be configured via command lines, or user can put user-specifuc configuration files and lua scripts in `~/.config/mpv`.

The script in `mpv` will install **[MPV](http://mpv.io)** via **[Homebrew](http://brew.sh/)** as well as setting it up using my configuration files and two other lua scripts. In addition, `duti` will be installed to select **[MPV](http://mpv.io)** the default application for the most common video types.

```bash
cd mpv
./install.sh
```

#### - configuation files and lua scripts in `~/.config/mpv`:

* `mpv.conf` - The config file is read per-user. Most options from man page can be put into the configuration file by dropping the preceding `--`. See full documentation [here](http://mpv.io/manual/stable/).
* `input.conf` - User-defined key bindings for mpv.
* `lua-settings/osc.conf` - The config file can do limited configuation to the OSC. For instance, changing the layout for the OSC, avaiable values are: box, slimbox, bottombar and topbar.
* `scripts/autoload.lua` - Automatically load playlist entries before and after the currently playing file, by scanning the directory.
* `scripts/vo_battery.lua` - Choose the `vo` based on if the laptop is on battery or not. For instance, when on ac power, the `vo` is set to `opengl-hq:interpolation:icc-profile-auto:icc-cache=~/.config/mpv/tmp/icc-cache:blend-subtitles=yes`; when on battery, the `vo` is set to `opengl:icc-profile-auto`.

Reminder: `opengl-hq` should be only used when your laptop has *Intel HD 4000 graphics* or above. Otherwise, stick to `opengl` for the `vo`. When equipped with a dedicated video card, you could try adding `interpolation` to the `vo` to reduce stuttering caused by mismatches in the video fps and display refresh rate.

## Feedback

Suggestions/improvements
[welcome](https://github.com/mrcotter/mrcotter_dotfiles/issues)!

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Shrey Banga](https://github.com/milkbikis) and his [powerline-shell](https://github.com/milkbikis/powerline-shell)
* [Chenwen Song](https://songchenwen.github.io) and his [dotfiles](https://github.com/songchenwen/dotfiles)

