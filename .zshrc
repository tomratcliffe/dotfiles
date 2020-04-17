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

# https://stackoverflow.com/a/9810485
__git_files () {
    _wanted files expl 'local files' _files
}

source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit -i

# todo:
# add check for when last pull was from git, if greater than whatever
# pull into dotfiles repo and run update/init after this
# https://github.com/jez/dotfiles/blob/master/util/auto-update.sh
# https://stackoverflow.com/questions/2993902/how-do-i-check-the-date-and-time-of-the-latest-git-pull-that-was-executed#comment48416885_9229377

source ~/.functions.sh
source ~/.aliases.sh

# added by travis gem
[ -f /Users/tom/.travis/travis.sh ] && source /Users/tom/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
