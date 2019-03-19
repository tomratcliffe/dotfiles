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
