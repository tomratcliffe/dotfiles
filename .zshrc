export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:~/.oh-my-zsh"
export NODE_ENV=dev
export NVM_DIR="$HOME/.nvm"

# Set name of the theme to load.
ZSH_THEME="avit"

source ~/.functions.sh
source ~/.aliases.sh

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

COMPLETION_WAITING_DOTS="true"

plugins=(git)
plugins+=(zsh-better-npm-completion)
plugins+=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

