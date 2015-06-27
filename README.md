# mrcotter_dotfiles
Configuration dot files for OS X, Homebrew, MPV, etc. For **Developers**.

![Screenshot of my shell prompt](http://i.imgur.com/BAhLxy7.png)

Dotfiles might be the most important files on any Unix, Linux or Mac system. They **backup**, **restore**, and **sync** the prefs and settings for your system and apps.

It is convenient that adding dotfiles to GitHub, and I do encourage you to do the same. Thanks to the community, I learned from some previous works and made my own version within two days.

Well, let's get started and see how to use my dotfiles.

## First things first

* Install **[Xcode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)**.
* Install **Command Line Tools** for **[Xcode](https://itunes.apple.com/au/app/xcode/id497799835?mt=12)** in Terminal: `xcode-select --install`.
* Install the latest version of **[XQuartz](https://xquartz.macosforge.org)** for your OS. Many projects may require the up-to-date libraries.
* For Java development, Java SE Development Kit is required. You can install both **[Apple's Java 6](https://support.apple.com/downloads/DL1572/en_US/JavaForOSX2014-001.dmg)** and **[Oracle's Java 8](http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-macosx-x64.dmg)**.

Reminder: Java 6 is now **_deprecated and not supported_**, and the current OS X El Capitan Developer Beta 2 has issues installing Java 6 and running application that requires legacy Java version.

## Install Homebrew

