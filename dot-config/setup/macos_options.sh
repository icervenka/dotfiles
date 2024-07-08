# from https://github.com/arkandas/dotfiles/blob/main/mac_os/os_settings/os_prefs.sh

# ==================
#   Dock
# ==================
# Dock icon size of 25 pixels
defaults write com.apple.dock "tilesize" -int 50
# Don't show recently used apps in the Dock
defaults write com.apple.dock "show-recents" -bool false
# Always display the dock
defaults write com.apple.dock "autohide" -bool false
# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
# Disable Bouncing dock icons
defaults write com.apple.dock no-bouncing -bool true

# ==================
#   Finder
# ==================
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Show Library folder
sudo chflags nohidden ~/Library
# Show the /Volumes folder
sudo chflags nohidden /Volumes
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Show all filename extensions
defaults write -g AppleShowAllExtensions -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# ==================
#   System
# ==================
# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null
# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1
# Disable automatic window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Disable Resume applications on reboot (system-wide)
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
defaults write -g NSQuitAlwaysKeepsWindows -bool false

# TODO mail options don't work
# # ==================
# #   Mail
# # ==================
# # Disable send and reply animations in Mail.app
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true
# # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
# # Display emails in threaded mode, sorted by date (oldest at the top)
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# ==================
#   iTerm2
# ==================
# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0
# Don't display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# ==================
#   Printer
# ==================
# Show Expanded Print Dialog by Default
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE

# ==================
#   Screenshots
# ==================
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Create Screenshots folder for the current user
mkdir -p /Users/$USER/Screenshots
# Save screenshots to the /Users/$USER/Screenshots folder
defaults write com.apple.screencapture location /Users/$USER/Screenshots && killall SystemUIServer

# ==================
#   Bluetooth
# ==================
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# ==================
#   Menu Bar
# ==================
# Set date format in menu bar
defaults write com.apple.menuextra.clock.plist DateFormat -string "dd-MM-yyyy HH:mm"
# Show battery icon in Menu Bar
defaults -currentHost write "com.apple.controlcenter" "Battery" -int 22
# Show Battery percentage in Menu Bar
defaults -currentHost write "com.apple.controlcenter" "BatteryShowPercentage" -bool "true"
# Don't show Keyboard Brightness icon in Menu Bar
defaults -currentHost write "com.apple.controlcenter" "KeyboardBrightness" -int 8
# Don't show AirDrop icon in Menu Bar
defaults -currentHost write "com.apple.controlcenter" "AirDrop" -int 8
# Don't show Siri icon in Menu Bar
defaults write "com.apple.Siri" "StatusMenuVisible" -bool "false"
# Don't show Spotlight icon in Menu Bar
defaults -currentHost write "com.apple.Spotlight" "MenuItemHidden" -bool "true"