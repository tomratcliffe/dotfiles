function setupMacOs() {
    # Make Mac finder show hidden files
    defaults write com.apple.finder AppleShowAllFiles YES

    # Change default location for saving screenshots
    mkdir -p ~/Documents/Screenshots
    defaults write com.apple.screencapture location ~/Documents/Screenshots

    # Trackpad: enable tap to click for this user and for the login screen
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    # Enable full keyboard access for all controls
    # (e.g. enable Tab in modal dialogs)
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    # Finder: show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Finder: show status bar
    defaults write com.apple.finder ShowStatusBar -bool true

    # Keep folders on top when sorting by name
    defaults write com.apple.finder _FXSortFoldersFirst -bool true

    # Show the ~/Library folder
    chflags nohidden ~/Library

    # Change minimize/maximize window effect
    defaults write com.apple.dock mineffect -string "scale"

    # Speed up Mission Control animations
    defaults write com.apple.dock expose-animation-duration -float 0.1

    # Disable the over-the-top focus ring animation
    defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

    # Don’t show recent applications in Dock
    defaults write com.apple.dock show-recents -bool false

    # Set default size for dock icons
    defaults write com.apple.dock tilesize -int 35

    # Show battery percentage
    defaults write com.apple.menuextra.battery ShowPercent YES

    # Show seconds in clock in menu bar
    defaults write com.apple.menuextra.clock DateFormat "EEE d MMM  HH:mm:ss"
    defaults write com.apple.menuextra.clock ShowSeconds 1

    # Touchbar
    defaults write com.apple.touchbar.agent PresentationModeGlobal fullControlStrip

    # Enable full keyboard access for all controls
    # (e.g. enable Tab in modal dialogs)
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    # Set new finder window location
    defaults write com.apple.finder NewWindowTarget PfHm
    defaults write com.apple.finder NewWindowTargetPath -string "file://~"

    # Trackpad: enable tap to click for this user and for the login screen
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    # Trackpad: swipe between pages with three fingers
    defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

    killall SystemUIServer
    killall Finder
    killall Dock
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setupMacOs;
else
    echo "${MESSAGE_PREFIX} Setup macOS defaults? ";
    read -p "(y/n): " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "${MESSAGE_PREFIX} Setting macOS defaults"
        setupMacOs;
    else
        echo "${MESSAGE_PREFIX_WARNING} Skipping macOS defaults"
    fi;
fi;
unset setupMacOs;
