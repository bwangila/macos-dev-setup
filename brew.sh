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
echo -e "${bold_yellow}"
echo "# HOMEBREW"
echo "#=======================================#"
echo -e "${normal}"
echo -e "${bold_green}==> Checking for/installing Homebrew..${normal}"
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo ""
echo -e "${bold_green}==> Updating Homebrew & Homebrew Formulae..${normal}"
brew update && brew upgrade



# Install Bash.
# *********************************
echo -e "${bold_yellow}"
echo "# BASH"
echo "#=======================================#"
echo -e "${normal}"
echo -e "${bold_green}==> Installing and configuring Bash..${normal}"
brew install bash
brew install bash-completion2
# Let's activate Bash, the new shell..
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash



# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# *********************************
echo -e "${bold_yellow}"
echo "# CORE TERMINAL BINARIES"
echo "#=======================================#"
echo -e "${normal}"
echo -e "${bold_green}==> Installing GNU Core Utilities..${normal}"
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install moreutils  # Install some other useful utilities like `sponge`.
brew install findutils  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install gnu-sed    # Install GNU `sed`, overwriting the built-in `sed`.

echo ""
echo -e "${bold_green}==> Installing Wget..${normal}"
brew install wget

echo ""
echo -e "${bold_green}==> Installing Vim..${normal}"
brew install vim

echo ""
echo -e "${bold_green}==> Installing Grep..${normal}"
brew install grep

echo ""
echo -e "${bold_green}==> Installing Screen..${normal}"
brew install screen

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
echo -e "${bold_yellow}"
echo "# GIT & Git APPS"
echo "#=======================================#"
echo -e "${normal}"
echo -e "${bold_green}==> Installing Git..${normal}"
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras

echo ""
echo -e "${bold_green}==> Installing Github –– Git GUI by Github..${normal}"
brew cask install --appdir="/Applications" github                   # Git GUI by Github

echo ""
echo -e "${bold_green}==> Installing Git Kraken..${normal}"
brew cask install --appdir="/Applications" gitkraken                # Git GUI



# Install font tools.
# *********************************
echo -e "${bold_yellow}"
echo "# FONTS & FONT TOOLS"
echo "#=======================================#"
echo -e "${normal}"
echo -e "${bold_green}==> Installing Webfont Tools..${normal}"
brew install fontforge ttf2eot ttfautohint
brew tap bramstein/webfonttools
brew tap caskroom/fonts
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

echo -e ""
echo -e "${bold_green}==> Installing Code Fonts..${normal}"
brew cask install font-consolas-for-powerline
brew cask install font-fira-code
brew cask install font-inconsolata
brew cask install font-roboto-mono
brew cask install font-source-code-pro



# Install other useful binaries.
# *********************************
echo ""
echo -e "${bold_green}==> Installing other useful binaries..${normal}"
brew install ack                      # code search tool
brew install dark-mode                # conrol dark mode from the command line
brew install imagemagick --with-webp  # image manipulation tools and libraries
brew install mackup                   # backup all your application settings to a cloud provider
brew install nmap                     # port scan utility
brew install pigz                     # parallel gzip for multicore processors
brew install speedtest_cli            # command line interface for speedtest.net
brew install tree                     # display directory trees with color output
brew install webkit2png               # take full webpage screenshots


#Virtualization
# *********************************
echo ""
echo -e "${bold_green}==> Installing Docker..${normal}"
echo "Installing Docker..."
brew install docker
brew install boot2docker


# Install iTerm
# *********************************
echo ""
echo -e "${bold_green}==> Installing iTerm2..${normal}"
brew cask install --appdir="/Applications" iterm2                   # Full-featured terminal


# Install IDEs & Code Editors
# *********************************
echo ""
echo -e "${bold_green}==> Installing Jetbrains Toolbox –– Jetbrains Apps Manager..${normal}"
brew cask install --appdir="/Applications" jetbrains-toolbox        # Manages all Jetbrains Tools

echo ""
echo -e "${bold_green}==> Installing PHPStorm –– Best PHP IDE..${normal}"
brew cask install --appdir="/Applications" phpstorm                 # Best PHP IDE

echo ""
echo -e "${bold_green}==> Installing VS Code..${normal}"
brew cask install --appdir="/Applications" visual-studio-code       # Best front-end code editor

echo ""
echo -e "${bold_green}==> Installing Atom –– Extensible open source Code Editor..${normal}"
brew cask install --appdir="/Applications" atom                     # Simple, extensible code editor

echo ""
echo -e "${bold_green}==> Installing Sublime Text 2..${normal}"
brew cask install --appdir="/Applications" sublime-text             # It's Sublime Text :-)

echo ""
echo -e "${bold_green}==> Installing MacDown –– Quick Markdown Editor..${normal}"
brew cask install --appdir="/Applications" macdown                  # Editing Markdown files easily

echo ""
echo -e "${bold_green}==> Installing Dash –– Offline API Documentation..${normal}"
brew cask install --appdir="/Applications" dash                     # Offline documentation for everything

echo ""
echo -e "${bold_green}==> Installing Flux –– Blue light filter..${normal}"
brew cask install --appdir="/Applications" flux                     # Blue-light blocker, protect those eyes

echo ""
echo -e "${bold_green}==> Installing DrawIO –– Drawing flowcharts, schemas, userflows etc..${normal}"
brew cask install --appdir="/Applications" drawio                   # Drawing flowcharts, schemas, userflows etc

echo ""
echo -e "${bold_green}==> Installing MySQL Workbench –– GUI tool for MySQL Databases..${normal}"
brew cask install --appdir="/Applications" mysqlworkbench           # GUI for MySQL databases


# Browswes
echo -e "${bold_yellow}"
echo "# INTERNET BROWSERS"
echo "#=======================================#"
echo -e "${normal}"
echo "Installing Google Chrome..."
brew cask install --appdir="/Applications" google-chrome
echo ""
echo "Installing Firefox..."
brew cask install --appdir="/Applications" firefox


# VPNs
echo -e "${bold_yellow}"
echo "# VPNs"
echo "#=======================================#"
echo -e "${normal}"
echo "Installing Outline VPN..."
brew cask install --appdir="/Applications" outline                  # Outline VPN
brew cask install --appdir="/Applications" outline-manager          # Outline VPN Manager
echo ""
echo "Installing OpenVPN..."
brew install openvpn


# Social Apps
echo -e "${bold_yellow}"
echo "# Messaging/Social Apps"
echo "#=======================================#"
echo -e "${normal}"
echo "Installing Skype.."
brew cask install --appdir="/Applications" skype
echo ""
echo "Installing Slack.."
brew cask install --appdir="/Applications" slack


# Productivity
echo -e "${bold_yellow}"
echo "# Productivity Apps"
echo "#=======================================#"
echo -e "${normal}"
echo "Installing TickTick –– To-do list app.."
brew cask install --appdir="/Applications" ticktick
echo ""
echo "Installing Toggl –– Time Tracking app.."
brew cask install --appdir="/Applications" toggldesktop
echo ""
echo "Installing Evernote.."
brew cask install --appdir="/Applications" evernote
echo ""
echo "Installing Notion –– Note-taking app.."
brew cask install --appdir="/Applications" notion
echo ""
echo "Installing 1Password –– Password Manager.."
brew cask install --appdir="/Applications" 1password
echo ""
echo "Installing Spectacle –– Window Manager.."
brew cask install --appdir="/Applications" spectacle
echo ""
echo "Installing Bartender –– Menu Bar Manager.."
brew cask install --appdir="/Applications" bartender
echo ""
echo "Installing Caffeine –– Keep Mac Awake.."
brew cask install --appdir="/Applications" caffeine
echo ""
echo "Installing Adobe Acrobat Reader.."
brew cask install --appdir="/Applications" adobe-acrobat-reader
echo ""
echo "Installing Kindle.."
brew cask install --appdir="/Applications" kindle
echo ""
echo "Installing Sketch –– UI Design App.."
brew cask install --appdir="/Applications" sketch


# Cloud Sync and Back Up
echo -e "${bold_yellow}"
echo "# Backup & Sync Apps"
echo "#=======================================#"
echo -e "${normal}"
echo "Installing Dropbox.."
brew cask install --appdir="/Applications" dropbox
echo ""
echo "Installing Google Drive.."
brew cask install --appdir="/Applications" google-drive


# Media Players
echo -e "${bold_yellow}"
echo "# Media/Video/Audio Apps"
echo "#=======================================#"
echo -e "${normal}"
echo "Installing Boom 3D.."
brew cask install --appdir="/Applications" boom-3d
echo ""
echo "Installing Spotify.."
brew cask install --appdir="/Applications" spotify
echo ""
echo "Installing VLC.."
brew cask install --appdir="/Applications" vlc
echo ""
echo "Installing Plex Media Player –– Home Theatre App.."
brew cask install --appdir="/Applications" plex-media-player
echo ""
echo "Installing Pocket Casts –– Podcast App.."
brew cask install --appdir="/Applications" pocket-casts

# System Tools
echo "Installing System Apps.."
echo ""
echo "Installing The Unarchiver –– Unzip tool.."
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
brew cask install qlcolorcode
brew cask install qlvideo
brew cask install quicklookapk
brew cask install webpquicklook
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install suspicious-package

# Remove outdated versions from the cellar.
echo "Removing outdated versions from homebrew..."
brew cleanup
