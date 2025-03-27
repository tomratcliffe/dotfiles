source ~/dotfiles.helper.sh

# echo "${MESSAGE_PREFIX} Initialising..."

ZSH_DISABLE_COMPFIX=true
HUSKY_SKIP_HOOKS="1"
HUSKY=0

plugins=(
    git
    zsh-better-npm-completion
    zsh-syntax-highlighting
)

COMPLETION_WAITING_DOTS="true"

DRACULA_DISPLAY_NEW_LINE=1
ZSH_THEME="dracula"
RPROMPT=""

# https://github.com/Homebrew/homebrew-core/commit/f710a1395f44224e4bcc3518ee9c13a0dc850be1#diff-3e84bae646d908b93e043833873d316dL16
# https://github.com/ohmyzsh/ohmyzsh/issues/7459#issuecomment-542786200

zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh/site-functions $fpath)

export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:~/.oh-my-zsh"
export NODE_ENV=development
export NVM_DIR="$HOME/.nvm"

# https://stackoverflow.com/a/9810485
__git_files () {
    _wanted files expl 'local files' _files
}

source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# TODO: https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# todo:
# add check for when last pull was from git, if greater than whatever
# pull into dotfiles repo and run update/init after this
# https://github.com/jez/dotfiles/blob/master/util/auto-update.sh
# https://stackoverflow.com/questions/2993902/how-do-i-check-the-date-and-time-of-the-latest-git-pull-that-was-executed#comment48416885_9229377

source ~/.functions.sh
source ~/.aliases.sh

# echo "${MESSAGE_PREFIX} Setting up work specific settings"
source ~/work-specific/grafana.secrets.sh
source ~/work-specific/grafana.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/homebrew/bin"


bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

export PATH="$HOME/.local/bin:$PATH"

# Include go binaries so RRC (grafana) can work
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/Code/deployment_tools/scripts/gcom:$PATH"
export PATH="/usr/local/opt/go@1.21/bin:$PATH"
