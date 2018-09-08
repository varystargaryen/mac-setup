#!/bin/bash

# Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/.macos

echo "Beginning macOS Settings configuration"

echo "Gaining administrator privileges (these will be kept until the script is finished)"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Expanded save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "Expanded print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Save to disk by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Automatically quit printer app once print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

echo "Enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Disable \"natural\" scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Set language and text formats"
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

echo "Show language menu in the top right corner of the boot screen"
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

echo "Set timezone"
sudo systemsetup -settimezone "America/Los_Angeles" > /dev/null

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Save screenshots to ~/Temp"
defaults write com.apple.screencapture location -string "${HOME}/Temp"

echo "Save screenshots in PNG format"
defaults write com.apple.screencapture type -string "png"

echo "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Set ~/Temp as the default location for new Finder windows"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Temp/"

echo "Show icons for servers and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "Don't show internal hard drives on the desktop"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Display full path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Expand the following File Info panes: \"General\", \"Open with\", and \"Sharing & Permissions\""
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

echo "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Copy email addresses as \`foo@example.com\` instead of \`Foo Bar <foo@example.com>\` in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo "Disable inline attachments (just show the icons)"
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

echo "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

echo "Allow the App Store to reboot machine on macOS updates"
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

echo "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Transmission: Don’t prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

echo "Transmission: Don’t prompt for confirmation before removing non-downloading active transfers"
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

echo "Transmission: Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "Transmission: Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

echo "Transmission: Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

echo "Transmission: IP block list"
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

echo "Adding 3 spacers to the dock"
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}'

echo "Remove Dock Show and Hide Delay"
defaults write com.apple.Dock autohide-delay -float 0

echo "Installing San Francisco Pro Display, Pro Text, and Mono Fonts for User Use"
# SF Mono
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/* ~/Library/Fonts/ 
# SF Pro Display and Pro Text
curl -LOk https://developer.apple.com/fonts/downloads/SFPro.zip
unzip -a SFPro.zip
rm SFPro.zip
cd SFPro
sudo installer -pkg San\ Francisco\ Pro.pkg -target /
cd ..

echo "Terminal Profile"
open Pro Modified.terminal
defaults write com.apple.Terminal "Default Window Settings" -string "Pro Modified"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro Modified"

echo "Show Debug Menu in App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

echo "Show Debug Menu in Contacts"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

echo "Enable Develop Menu & Web Inspector in Safari"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

echo "Use Backspace/Delete to Return to the Previous Page in Safari"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

echo "Enable 'Focus Follows Mouse' in Terminal & All X11 Apps"
defaults write com.apple.Terminal FocusFollowsMouse -bool true
defaults write org.x.X11 wm_ffm -bool true

echo "Fix VSCodeVim Key Repeat in Microsoft Visual Studio Code"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo "Disabling Creation of Metadata Files on Network Volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disabling Creation of Metadata Files on USB Volumes"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Enable Full Keyboard Access for All Controls (Enable Tab in Modal Dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Enable Snap-to-Grid for Icons"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "Disable Safari's Thumbnail Cache for History & Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Make Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "Add a Context Menu Item Show Web Inspector in Web Views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo "Enable Continuous Spellchecking"
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

echo "Enable Auto-Correction"
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

echo "Warn About Fraudulent Websites"
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

echo "Block Pop-Up Windows"
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

echo "Disable Auto-Playing Videos"
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

echo "Enable Do Not Track"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "Enable Auto-Updating of Safari Extensions"
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

echo "Display E-mails in Threaded Mode, Sorted Descending by Date Received"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

echo "Enable Spell-Checking in Mail"
defaults write com.apple.mail SpellCheckingBehavior -string "SpellCheckingEnabled"

echo "Disable Automatic Line Marking in Terminal"
defaults write com.apple.Terminal ShowLineMarks -int 0

echo "Prevent Time Machine from Automatically Prompting to Use New External Hard Drives as a Backup Volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

echo "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

echo "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

echo "Enable the Debug Menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

echo "Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

echo "Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

echo "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

echo "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Use the system-native print preview dialog"
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

echo "Expand the print dialog by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

echo "Killing affected apps"
for app in "Activity Monitor" \
	"Address Book" \
	"App Store" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Transmission" \
	"Visual Studio Code" \
	"iCal"; do
	killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
echo "Terminal must be restarted manually for the Terminal profile settings to work."