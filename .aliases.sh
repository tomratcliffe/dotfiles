# Git
alias glu="git log @{u}.."
alias gip="git branch --sort="-committerdate" -vv | grep -m 10 'wip'"
alias gipa="git branch --sort="-committerdate" -vv | grep 'wip'"

# NPM
alias nrt="npm run tdd"

# Project specifics
alias mysa-dock='(sudo ifconfig lo0 alias 192.168.99.100 ) && (docker start cloudant-developer)'

# NVM
nvm_load () {
  . $NVM_DIR/nvm.sh
  . $NVM_DIR/bash_completion
}

alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'
