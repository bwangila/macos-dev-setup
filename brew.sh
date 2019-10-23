#!/usr/bin/env bash

#====================================================================================#
# STEP 03: HOMEBREW & MAC APPS..                                                     #
# Installing Homebrew along with some common formulae and apps.                      #
#====================================================================================#

# Ask for the administrator password upfront.
# *********************************
#sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Let's add some fancy colors to the terminal output
# *********************************
bold_green="\e[1m\e[32m"
bold_yellow="\e[1m\e[34m"
normal="\e[0m"

# Check for Homebrew, and install if we don't have it
# *********************************
echo ""
echo -e "${bold_green}==> Checking for/installing Homebrew..${normal}"
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
# *********************************
echo ""
echo -e "${bold_green}==> Updating Homebrew & Homebrew Formulae..${normal}"
brew update && brew upgrade



# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# *********************************
echo ""
echo -e "${bold_green}==> Installing GNU Core Utilities..${normal}"
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed


# Install Bash.
# *********************************
echo ""
echo -e "${bold_green}==> Installing and configuring Bash..${normal}"
brew install bash
brew install bash-completion2
# Let's activate Bash, the new shell..
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash


# Install more recent versions of some OS X tools.
# *********************************
echo ""
echo -e "${bold_green}==> Installing wget, vim, grep and screen..${normal}"
brew install wget
brew install vim
brew install grep
brew install screen


# Install openssh
# *********************************
echo ""
echo -e "${bold_green}==> Installing Openssl and Openssh..${normal}"
brew install openssl
brew install openssh --with-brewed-openssl --with-keychain-support


# Install Python
# *********************************
echo ""
echo -e "${bold_green}==> Installing Python..${normal}"
brew install python
brew install python3


# Install Java
# *********************************
echo ""
echo -e "${bold_green}==> Installing Java..${normal}"
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz


# Install Git
# *********************************
echo ""
echo -e "${bold_green}==> Installing Git..${normal}"
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras


# Install font tools.
# *********************************
echo ""
echo -e "${bold_green}==> Installing Font Tools..${normal}"
brew tap bramstein/webfonttools
brew tap caskroom/fonts
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2


# Install other useful binaries.
# *********************************
echo ""
echo -e "${bold_green}==> Installing other useful binaries..${normal}"
brew install ack
brew install dark-mode          # conrol dark mode from the command line
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install nmap
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc


#Virtualization
# *********************************
echo -e "${bold_green}==> Installing Docker..${normal}"
echo "Installing Docker..."
brew install docker
brew install boot2docker


# Install iTerm
# *********************************
echo ""
echo -e "${bold_green}==> Installing iTerm2..${normal}"
brew cask install --appdir="/Applications" iterm2


# Install IDEs & Code Editors
# *********************************
echo ""
echo -e "${bold_green}==> Installing Jetbrains Toolbox and PHPStorm..${normal}"
brew cask install --appdir="/Applications" jetbrains-toolbox        # Manages all Jetbrains Tools
brew cask install --appdir="/Applications" phpstorm                 # Best PHP IDE

echo ""
echo -e "${bold_green}==> Installing VS Code..${normal}"
brew cask install --appdir="/Applications" visual-studio-code       # Best front-end code editor

echo ""
echo -e "${bold_green}==> Installing Atom..${normal}"
brew cask install --appdir="/Applications" atom                     # Simple, extensible code editor

echo ""
echo -e "${bold_green}==> Installing Sublime Text 2..${normal}"
brew cask install --appdir="/Applications" sublime-text             # It's Sublime Text :-)

echo ""
echo -e "${bold_green}==> Installing MacDown..${normal}"
brew cask install --appdir="/Applications" macdown                  # Editing Markdown files easily

echo "Installing more Developer Tools..."
brew cask install --appdir="/Applications" dash                     # Offline documentation for everything
brew cask install --appdir="/Applications" flux                     # Blue-light blocker, protect those eyes
brew cask install --appdir="/Applications" drawio                   # Drawing flowcharts, schemas, userflows etc
brew cask install --appdir="/Applications" github                   # Git GUI by Github
brew cask install --appdir="/Applications" mysqlworkbench           # GUI for MySQL databases

# Browswes
echo "Installing Browsers..."
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox

# VPNs
echo "Installing VPNs..."
brew cask install --appdir="/Applications" outline
brew cask install --appdir="/Applications" outline-manager
brew cask install --appdir="/Applications" tunnelbear

# Social Apps
echo "Installing Social Apps..."
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack

# Productivity
echo "Installing Productivity Apps..."
brew cask install --appdir="/Applications" ticktick
brew cask install --appdir="/Applications" toggldesktop
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" notion
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" adobe-acrobat-reader
brew cask install --appdir="/Applications" smallpdf
brew cask install --appdir="/Applications" kindle
brew cask install --appdir="/Applications" sketch

# Cloud Sync and Back Up
echo "Installing Cloud Sync and Backup Apps..."
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" google-drive

# Media Players
echo "Installing Media Players..."
brew cask install --appdir="/Applications" boom-3d
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" plex-media-player
brew cask install --appdir="/Applications" pocket-casts

# System Tools
echo "Installing System Apps..."
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" cleanmymac
brew cask install --appdir="/Applications" cheatsheet
brew cask install --appdir="/Applications" teamviewer
brew cask install --appdir="/Applications" numi
brew cask install --appdir="/Applications" android-file-transfer
brew cask install --appdir="/Applications" daisydisk
brew cask install --appdir="/Applications" fliqlo
brew cask install --appdir="/Applications" garmin-basecamp

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlvideo quicklookapk webpquicklook qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize suspicious-package

# Remove outdated versions from the cellar.
echo "Removing outdated versions from homebrew..."
brew cleanup
