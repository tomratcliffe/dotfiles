echo "${MESSAGE_PREFIX} Setting up aliases..."

# Git
# Show which commits are ahead of the upstream
alias glu="git log @{u}.."

# Show the diff of the commits that are ahead of the upstream
alias gdu="git diff @{u}.."

# Show the last 10 work-in-progress branches
alias gip="git branch --sort="-committerdate" -vv | grep -m 10 'wip'"

# Show all work-in-progress branches
alias gipa="git branch --sort="-committerdate" -vv | grep 'wip'"

# Log shorthand with nicer format
alias glg="git log --stat --format=fuller"

# Push without verifying, circumvents husky checks etc
alias gpnv="git push --no-verify"

# Set upstream and push without verifying
alias gpsupnv="gpsup --no-verify"

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
