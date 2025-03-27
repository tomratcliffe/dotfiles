#!/usr/bin/env bash

function installTools() {
    # Install homebrew if it is not installed
    which brew 1>&/dev/null
    if [ ! "$?" -eq 0 ] ; then
        echo "Homebrew not installed. Attempting to install Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [ ! "$?" -eq 0 ] ; then
            echo "Something went wrong. Exiting..." && exit 1
        fi
    fi

    brew update

    brew upgrade

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    brew install docker

    brew install tmux

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Install TPM plugins so we don't have to manually do it with "prefix + I" after
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh

    brew install zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone https://github.com/lukechilds/zsh-better-npm-completion.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-better-npm-completion
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    git clone https://github.com/dracula/zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula
    ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

    brew install gh

    brew cask install visual-studio-code

    # https://github.com/rxhanson/Rectangle
    brew install --cask rectangle
    # TODO: configure prefs for rectangle after install

    # brew install awscli

    brew install fzf

    brew install jq

    brew install coreutils

    brew install ack

    brew install go

    brew install jsonnet

    brew install shellcheck

    brew install spotify-tui

    brew cleanup

    # Install powerline fonts for ZSH themes etc.
    mkdir -p ~/.tmp
    git clone https://github.com/powerline/fonts.git --depth=1 ~/.tmp/fonts
    cd ~/.tmp/fonts
    zsh ./install.sh
    cd ..
    rm -rf ~/.tmp/fonts
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    installTools;
else
    echo "${MESSAGE_PREFIX} Install brew and other tools? ";
    read -p "(y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "${MESSAGE_PREFIX} Installing... ";
        installTools;
    else
        echo "${MESSAGE_PREFIX_WARNING} Skipping tool installation"
    fi;
fi;
unset installTools;
