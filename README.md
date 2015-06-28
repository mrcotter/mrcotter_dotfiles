# mrcotter_dotfiles
Configuration dot files for OS X, Homebrew, MPV, etc. For **Developers**.

![Screenshot of Terminal](http://i.imgur.com/UZhJURm.png)

`Dotfiles` might be the most important files on any Unix, Linux or Mac system. They **backup**, **restore**, and **sync** the prefs and settings for your system and apps.

It is convenient that adding `dotfiles` to GitHub, and I do encourage you to do the same. Thanks to the community, I learned from some previous works and made my own version within two days.

Well, let's get started and see how to use my `dotfiles`.

## First things first

* Install **[Xcode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)**.
* Install **Command Line Tools** for **[Xcode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)** in Terminal: `xcode-select --install`.
* Install the latest version of **[XQuartz](https://xquartz.macosforge.org)** for your OS. Many projects may require the up-to-date libraries.
* For Java development, Java SE Development Kit is required. You can install both **[Apple's Java 6](https://support.apple.com/downloads/DL1572/en_US/JavaForOSX2014-001.dmg)** and **[Oracle's Java 8](http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-macosx-x64.dmg)**.

Reminder: Java 6 is now **_deprecated and not supported_**, and the current OS X El Capitan Developer Beta 2 has issues installing Java 6 and running application that requires the legacy Java version.

## Download dotfiles

### Using Git

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

In the recipes script, you can simply comment out or delete those fomulae that you don't want to install. But beware, there are also configurations in `dotfiles` that relate to some of them. Make sure you understand the files and edit the fomulae properly. For instance, GNU core utilities, bash, ant, maven, jenv.

## Install Dotfiles

To install, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

To update form my repository, simply run the command above again. The bootstrapper script will pull in the latest version and copy the files to your local folder.

### About `$PATH`

If there is a need to extend or modify `$PATH`, locate to `~/.path`. This is the one which is sourced along with the other files. Like this:

```bash
sudo nano ~/.path
```

### Solarized Theme for iTerm2 / Terminal

I use a custom bash prompt based on the **[Solarized color palette](http://ethanschoonover.com/solarized)**. It's quite common to install **[iTerm2](https://www.iterm2.com/)** (a cool Terminal replacement) and import `Solarized Dark.itermcolors` (The files are in the folder `solarized_theme`, `Solarized Dark xterm-256color.terminal` is for build-in Terminal).

### Powerline-shell for Bash

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


