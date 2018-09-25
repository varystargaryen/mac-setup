# mac-setup

Hexalellogram's macOS Setup Scripts (Modified for use by VarysTargaryen)

## Download and Run:
Paste this into the macOS Terminal:

`curl -LOk https://github.com/varystargaryen/mac-setup/archive/master.zip && unzip -a master.zip && rm master.zip && cd mac-setup-master && chmod +x ProgramInstall.sh && ./ProgramInstall.sh`

## Prerequisites
- [Xcode.app or Xcode-beta.app](https://developer.apple.com/download/) installed

## Binaries Installed via Homebrew 
### (List may not be 100% up to date, for the up to date list, see `Brewfile`)
- `mas`
- `wget`
- `tree`
- `m-cli`
- `archey`
- `hub`
- `trash`
- `thefuck`
- `dos2unix`
- `boxes`
- `cask-repair`

## GUI Applications Installed

### Core/Essentials
- [x] [Steam](http://store.steampowered.com/about/)
- [ ] [Karabiner Elements](https://github.com/tekezo/Karabiner-Elements)
- [x] [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html)
- [x] [BetterTouchTool](https://www.boastr.net) ([Custom Settings](https://github.com/hexalellogram/mac-setup/wiki/BTT-Shortcuts) automatically imported)
- [ ] [Carbon Copy Cloner](https://bombich.com)
- [x] [Spotify](http://spotify.com)
- [x] [Microsoft Office](https://www.office.com)
- [ ] [VMware Fusion](https://www.vmware.com/products/fusion.html)
- [x] [YakYak](https://github.com/yakyak/yakyak) ~~(Removed for now in favor of manually installed self-compiled version)~~
- [x] [Caprine](https://github.com/sindresorhus/caprine)
- [ ] [Plex Media Server](https://www.plex.tv/)
- [x] [Plex Media Player](https://www.plex.tv/apps/computer/plex-media-player/)

### Menubar Apps
- [x] [Dropbox](https://www.dropbox.com/?landing=dbv2)
- [x] [Google Backup and Sync](https://drive.google.com)
- [x] [Google Drive File Stream](https://support.google.com/drive/answer/7329379?hl=en&authuser=7)
- [x] [OneDrive](https://support.office.com/en-us/article/New-OneDrive-sync-client-release-notes-845dcf18-f921-435e-bf28-4e24b95e5fc0) (See the "separate download" link under the Downloads header)
- [x] [Spotify Notifications](https://spotify-notifications.citruspi.io)
- [x] [Synergy](http://symless.com/)
- [x] [Bartender](https://www.macbartender.com/)
- [x] [Spectacle](https://github.com/eczarny/spectacle)
- [x] [Background Music](https://github.com/kyleneideck/BackgroundMusic)
- [x] [Apple Juice](https://github.com/raphaelhanneken/apple-juice)

### [Objective-See](https://objective-see.com/) Security Apps
- [x] [BlockBlock](https://objective-see.com/products/blockblock.html)
- [x] [OverSight](https://objective-see.com/products/oversight.html)
- [x] [RansomWhere](https://objective-see.com/products/ransomwhere.html)
- [x] [What's Your Sign?](https://objective-see.com/products/whatsyoursign.html)
- [x] [TaskExplorer](https://objective-see.com/products/taskexplorer.html)

### Code/Computer Science Apps
- [x] [GitKraken](https://www.gitkraken.com)
- [x] [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [x] [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- [x] [Eclipse Java IDE](http://www.eclipse.org)
- [x] [Visual Studio Code](https://code.visualstudio.com)
- [ ] [PowerShell](https://github.com/PowerShell/PowerShell)

### Other Apps/Utilities
- [x] [Android File Transfer](https://www.android.com/filetransfer/?linkid=14270770)
- [x] [AppCleaner](http://freemacsoft.net/appcleaner/)
- [x] [Keka](http://www.kekaosx.com/en/)
- [x] [Android Platform Tools](https://developer.android.com/studio/releases/platform-tools.html) (`adb`, `fastboot`, etc.)
- [ ] [MakeMKV](https://www.makemkv.com)
- [ ] [Handbrake](https://handbrake.fr)
- [ ] [MetaZ](https://griff.github.io/metaz/)
- [x] [IINA](https://lhc70000.github.io/iina/)
- [x] [Etcher](https://etcher.io/)
- [ ] [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)
- [ ] [Skype](https://www.skype.com/en/get-skype/)
- [ ] [Calibre](https://calibre-ebook.com/)
- [x] [Dolphin Emulator](https://dolphin-emu.org/)
- [x] [Authy](https://authy.com/)
- [ ] [TI Connect CE](https://education.ti.com/en/products/computer-software/ti-connect-ce-sw)
- [x] [Simple Comic](https://github.com/arauchfuss/Simple-Comic)
- [ ] [Arq Backup](https://www.arqbackup.com/)
- [x] [VNote](https://github.com/tamlok/vnote)
- [x] [Filebot](https://www.filebot.net/)
- [ ] [Google Play Music Desktop Player](https://www.googleplaymusicdesktopplayer.com/)
- [ ] [OpenEmu](http://openemu.org/)

### Finder Quick Look Generators
- [x] [BetterZipQL](https://macitbetter.com/BetterZip-Quick-Look-Generator/)
- [x] [QLColorCode](https://github.com/n8gray/QLColorCode)
- [x] [QLMarkdown](https://github.com/toland/qlmarkdown/)
- [x] [QLStephen](https://github.com/whomwah/qlstephen)

### Mac App Store Apps
- [x] [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
- [x] [Pages](https://www.apple.com/pages/)
- [x] [Keynote](https://www.apple.com/keynote/)
- [x] [Numbers](https://www.apple.com/numbers/)
- [x] [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)

### Steam Games
- [x] [Civilization V + DLC](http://www.civilization5.com)
- [x] [Rocket League](https://www.rocketleague.com)

## Other Stuff Configured
- [x] [Enable Touch ID PAM Module for Sudo in Terminal](https://derflounder.wordpress.com/2017/11/17/enabling-touch-id-authorization-for-sudo-on-macos-high-sierra/)
- [x] macOS System Settings ([Read echo statements here for details](https://github.com/hexalellogram/mac-setup/blob/master/SystemSettings.sh))
- [x] Create folder `~/Temp`
- [x] San Francisco [Pro Display](https://developer.apple.com/fonts/), [Pro Text](https://developer.apple.com/fonts/), and [Mono](https://simonfredsted.com/1438) Fonts Installed
- [x] Terminal configured to my custom settings (see [BasicModified.terminal](https://github.com/hexalellogram/mac-setup/blob/master/BasicModified.terminal)) - Pro Modified is essentially the standard Pro theme in macOS terminal, modified to use the San Francisco Mono font and a font size of 14.
- [x] Startup applications configured as per my preferences

## Applications To Be Installed Manually
- [ ] [Winclone](https://twocanoes.com/products/mac/winclone/)
- [x] [Android Messages for Desktop](https://github.com/kelyvin/Android-Messages-For-Desktop)
- [x] [eOS for Steam](https://github.com/tkashkin/eOSSteamSkin)
- [x] [Air for Steam](https://github.com/Outsetini/Air-for-Steam)
- [x] [HighSierraMediaKeyEnabler](https://github.com/milgra/highsierramediakeyenabler)
- [x] [Paragon NTFS](https://www.paragon-software.com/ntfs-for-mac-mojave-preview/)
- [x] [MATLAB](https://www.mathworks.com/downloads/web_downloads/select_release)
- [x] [ArchiSteamFarm](https://github.com/JustArchiNET/ArchiSteamFarm)
### Shortcut Applications
#### Boing
- [x] [Run Boing](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/Boing/Run%20Boing.app)
- [x] [Update Boing](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/Boing/Update%20Boing.app)
#### Miscellaneous
- [x] [Social Media](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/Social%20Media.app)
- [x] [Homebrew Updater](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/Homebrew%20Updater.app)
- [x] [Filebot](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/FileBot.app)
- [x] [Half-Life 2](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/Half-Life%202.app)
- [x] [ArchiSteamFarm](https://github.com/varystargaryen/mac-setup/tree/master/Shortcut%20Applications/ArchiSteamFarm.app)

## Other Stuff You Might Need to Know
- [Code of Conduct](https://github.com/hexalellogram/mac-setup/blob/master/CODE_OF_CONDUCT.md)
- This project is licensed under the [MIT License](https://github.com/varystargaryen/mac-setup/blob/master/LICENSE)
