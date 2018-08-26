#!/bin/bash

echo "welcome to Hexalellogram's Mac Setup Scripts."
read -n 1 -p "Do you want to proceed with running this script (see README.md for what it does), and is Xcode (or Xcode-beta) installed? (Y/n): " installAnswer && echo
if echo $installAnswer | grep -iq "^n"; then
    exit 1
else
    echo "You have chosen to proceed with running this script."
fi

echo "Making my Temp folder"
mkdir ~/Temp

echo "Gaining administrator privileges (these will be kept until the script is finished)"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -n "Making sure Xcode or Xcode-beta is installed..."
if [ -d /Applications/Xcode-beta.app ]; then
    echo "Xcode-beta.app detected!"
    sudo xcode-select -s /Applications/Xcode-beta.app # Set Xcode path to Xcode-beta
elif  [ -d /Applications/Xcode.app ]; then
    echo "Xcode.app detected!"
    sudo xcode-select -s /Applications/Xcode.app # Set Xcode path to Xcode
else
    echo "Xcode-beta or Xcode not found! Exiting..."
    exit 1
fi

echo "You have to accept the Xcode license. Keep pressing space until it prompts you to type accept."
sudo xcodebuild -license

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo "Installing all binaries and applications from Brewfile"
brew bundle # install all stuff from brew from Brewfile


echo "Beginning Installation of Steam Games in Background (do not close the new window)"
chmod + x SteamScript.sh
osascript -e 'tell app "Terminal" to do script "cd $PWD && ./SteamScript.sh"'

echo "Copying Karabiner Elements configuration..."
cp karabiner.json ~/.config/karabiner/karabiner.json # copy Karabiner Elements setup json in


echo "Configuring BTT Window Management KB Shortcuts"
cd BTTFiles
mkdir ~/Library/Application\ Support/BetterTouchTool
cp btt_data_store.v2 ~/Library/Application\ Support/BetterTouchTool/
cp btt_data_store.v2-shm ~/Library/Application\ Support/BetterTouchTool/
cp btt_data_store.v2-wal ~/Library/Application\ Support/BetterTouchTool/
cd -
echo "BTT Window Management KB Shortcuts Configured! See the repository wiki for details about what these keyboard shortcuts are and what they do!"

# Menubar Apps
echo "Installing Brightness Menulet"
chmod +x BrightnessMenulet.sh
./BrightnessMenulet.sh

echo "Installing BetterZipQL Quick Look Generator"
cp -R BetterZipQL.qlgenerator ~/Library/QuickLook/BetterZipQL.qlgenerator
qlmanage -r

# Cleanup
echo "Cleaning up"
brew prune
brew cleanup

# Install Touch ID PAM Module
read -n 1 -p "Do you want to enable the Touch ID PAM module for Sudo in Terminal? (Y/n): " pamAnswer && echo
if echo $pamAnswer | grep -iq "^n"; then
    echo "You have chosen to bypass the installation of the Touch ID PAM Modue."
else
    sudo cp /etc/pam.d/sudo /etc/pam.d/sudo.bak
    echo "Old /etc/pam.d/sudo backed up to /etc/pam.d/sudo.bak"
    sudo cp sudo /etc/pam.d/sudo
fi

# Set Startup Applications
echo "Setting Startup Applications"
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Reminders.app", hidden:false, name:"Reminders"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Mail.app", hidden:false, name:"Mail"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Messages.app", hidden:false, name:"Messages"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/BetterTouchTool.app", hidden:false, name:"BetterTouchTool"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/NordVPN.app", hidden:false, name:"NordVPN"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/OverSight.app/Contents/Library/LoginItems/OverSight Helper.app", hidden:false, name:"OverSight Helper"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent.app", hidden:false, name:"Android File Transfer Agent"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Insync.app", hidden:false, name:"Insync"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/OneDrive.app", hidden:false, name:"OneDrive"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Backup and Sync from Google.app", hidden:false, name:"Backup and Sync from Google"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Library/PreferencePanes/MenuMeters.prefPane/Contents/Resources/MenuMetersApp.app", hidden:false, name:"MenuMetersApp"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Carbon Copy Cloner.app/Contents/Library/LoginItems/CCC User Agent.app", hidden:false, name:"CCC User Agent"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Dropbox.app", hidden:false, name:"Dropbox"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Amphetamine.app", hidden:false, name:"Amphetamine"}'
# osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/YakYak.app", hidden:false, name:"YakYak"}'
# Removed for now as we install a self-compiled version of YakYak with Disabled History support. When YakYak updates, we will reenable this line.
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Itsycal.app", hidden:false, name:"Itsycal"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/WhatPulse.app", hidden:false, name:"WhatPulse"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Brightness Menulet.app", hidden:false, name:"Brightness Menulet"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/RescueTime.app", hidden:false, name:"RescueTime"}'
+osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Apple Juice.app", hidden:false, name:"Apple Juice"}'
echo "Startup Applications Set!"

# Reset Launchpad to display Apple applications first in alphabetical order, then 3rd party applications on the following pages
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock 

# Git pullall
cp git-pullall /usr/local/bin/git-pullall

# Finishing dialogs
echo "Installation of all programs complete!"
echo "The following apps must be installed manually as they are not in brew cask:"
echo "  Winclone"
echo "  Synergy"
echo "  YakYak"
echo "See README.md for download links"
echo ""
echo "The following apps must be activated:"
echo "  Winclone (not installed automatically)"
echo "  Carbon Copy Cloner"
echo "  Tuxera NTFS"
echo "  VMware Fusion"

read -n 1 -p "Would you like to configure macOS System Settings? (Y/n): " settingsAnswer && echo
if echo $settingsAnswer | grep -iq "^n"; then
    echo "You have chosen not to configure system settings."
else
    chmod +x SystemSettings.sh
    ./SystemSettings.sh
fi
