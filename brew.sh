#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
echo "Updating homebrew..."
brew update

# Upgrade any already-installed formulae.
echo "Upgrading homebrew formulae..."
brew upgrade --all

# TODO: Add descriptions to everything we are installing


# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
echo "Installing GNU Core utilities..."
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
echo "Installing wget..."
brew install wget --with-iri

# Install Python
echo "Installing Python..."
brew install python
brew install python3

# Install more recent versions of some OS X tools.
echo "Updating OSX Tools..."
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install font tools.
echo "Installing Font Tools..."
brew tap bramstein/webfonttools
brew tap caskroom/fonts
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
echo "Installing CTF Tools..."
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz

# Install other useful binaries.
echo "Installing Other Useful Binaries..."
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install lynx
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

# Core casks
echo "Installing Core Casks..."
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
# Terminal, IDEs & Editors
echo "Installing Terminal, IDEs and Text Editors..."
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" jetbrains-toolbox
brew cask install --appdir="/Applications" phpstorm
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" macdown

#Virtualization
echo "Installing Docker..."
brew install docker
brew install boot2docker

echo "Installing more Developer Tools..."
brew cask install --appdir="/Applications" dash
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" drawio
brew cask install --appdir="/Applications" github
brew cask install --appdir="/Applications" mysqlworkbench

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
