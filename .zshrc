source ~/dotfiles.helper.sh

echo "${MESSAGE_PREFIX} Initialising..."

plugins=(
    git
    zsh-better-npm-completion
    zsh-syntax-highlighting
)

COMPLETION_WAITING_DOTS="true"

ZSH_THEME="avit"

fpath=(~/.zsh/completion $fpath)

export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:~/.oh-my-zsh"
export NODE_ENV=dev
export NVM_DIR="$HOME/.nvm"


source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit -i

source ~/.functions.sh
source ~/.aliases.sh
