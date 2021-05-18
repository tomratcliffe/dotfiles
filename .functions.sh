echo "${MESSAGE_PREFIX} Setting up functions..."

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

function s() {
    if [ $# -eq 0 ]; then
        sublime .;
    else
        sublime "$@";
    fi;
}

function c() {
    if [ $# -eq 0 ]; then
        code .;
    else
        code "$@";
    fi;
}

function release_pick() {
    git cherry-pick -x $(git rev-list --right-only --no-merges --reverse --cherry-pick dev...$@)
}

function check_commits() {
    git show $1 | git patch-id --stable;
    git show $2 | git patch-id --stable;
}

# Open a pull request using github cli
# https://cli.github.com/manual/gh_pr_create
function opr() {
    if [ -n "$1" ]
    then
        gh pr create -w -B "$1"
    else
        gh pr create -w
    fi
}
