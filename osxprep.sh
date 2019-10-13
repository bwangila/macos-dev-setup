#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and Install Xcode Tools
echo "# ***********************************************************************************#"
echo "# UPDATING OSX.                                                                      #"
echo "# ***********************************************************************************#"

# Install all available updates
# *********************************
echo "# –– Installing all available updates.. In case of a restart, just run the script again."
echo "# ---------------------------------------"
sudo softwareupdate -ia --verbose

# Install only recommended available updates
# *********************************
#sudo softwareupdate -ir --verbose
#echo "–– Installing only recommended updates.. If this requires a restart, just run"
#echo "   the script again."

# Install Xcode command line tools
# *********************************
echo ""
echo "# –– Installing Xcode Command Line Tools.."
echo "# ---------------------------------------"
xcode-select --install
