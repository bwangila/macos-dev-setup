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

echo "Installing java..."
brew cask install --appdir="~/Applications" java

echo "Installing Intellij Idea COmmunity Edition..."
brew cask install --appdir="~/Applications" intellij-idea-ce

echo "Installing Android Studio..."
brew cask install --appdir="~/Applications" android-studio

echo "Installing Android SDK..."
brew install android-sdk

# Remove outdated versions from the cellar.
echo "Removing outdated version from homebrew..."
brew cleanup
