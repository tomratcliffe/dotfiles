#!/usr/bin/env bash

function installTools() {
    Install homebrew if it is not installed
    which brew 1>&/dev/null
    if [ ! "$?" -eq 0 ] ; then
        echo "Homebrew not installed. Attempting to install Homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ ! "$?" -eq 0 ] ; then
            echo "Something went wrong. Exiting..." && exit 1
        fi
    fi

    brew update

    brew upgrade

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

    brew install docker

    brew install tmux

    brew install zsh

    git clone https://github.com/lukechilds/zsh-better-npm-completion.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-better-npm-completion
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    brew install hub

    brew cask install visual-studio-code

    brew tap cloudfoundry/tap

    brew install cf-cli

    brew cleanup
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    installTools;
else
    read -p "This will install Brew and various tools. Continue? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        installTools;
    else
        echo "Skipping tool installation"
    fi;
fi;
unset installTools;

