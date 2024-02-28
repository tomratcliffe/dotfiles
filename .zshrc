source ~/dotfiles.helper.sh

echo "${MESSAGE_PREFIX} Initialising..."

ZSH_DISABLE_COMPFIX=true
HUSKY_SKIP_HOOKS="1"
HUSKY=0

plugins=(
    git
    zsh-better-npm-completion
    zsh-syntax-highlighting
)

COMPLETION_WAITING_DOTS="true"

ZSH_THEME="avit"
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

# Kubernetes autocomplete
source <(kubectl completion zsh)

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

echo "${MESSAGE_PREFIX} Setting up work specific settings..."
source ~/work-specific/congenica.secrets.sh
source ~/work-specific/congenica.sh

# < PYENV start >
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

plugin=(
  pyenv
)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Added so poetry can access it (?)
# export PATH="$HOME/.pyenv/versions/3.9.9/bin:$PATH"
# < PYENV end >

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PGDATA="/usr/local/var/postgresql@9.6"
export PATH="$PATH:$HOME/.bin/sonar-scanner/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/.krew/bin"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.1.0/bin:$PATH"
export PATH="$HOME/.samtools/bin:$PATH"

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

export PATH="$HOME/.local/bin:$PATH"
