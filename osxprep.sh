#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and Install Xcode Tools
# Install all available updates
# *********************************
echo "–– Installing all available updates.. In case of a restart, run the script again."
echo "---------------"
sudo softwareupdate -ia --verbose

# Install Xcode command line tools
# *********************************
echo ""
echo "–– Installing Xcode Command Line Tools.."
echo "---------------"
xcode-select --install
