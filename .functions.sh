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

function c() {
    if [ $# -eq 0 ]; then
        code .;
    else
        code "$@";
    fi;
}

# function release_pick() {
#     git cherry-pick -x $(git rev-list --right-only --no-merges --reverse --cherry-pick dev...$@)
# }

function get_commits_from_merge() {
    git log $1^..$1 --pretty=format:"%h" --reverse --no-merges
}

function release_pick() {
    # while getopts "n" opt; do
    #     case $opt in
    #         n)
    #         echo "-a was triggered, Parameter: $OPTARG" >&2
    #         ;;
    #         \?)
    #         echo "Invalid option: -$OPTARG" >&2
    #         exit 1
    #         ;;
    #         :)
    #         echo "Option -$OPTARG requires an argument." >&2
    #         exit 1
    #         ;;
    #     esac
    # done

    git cherry-pick -x $(get_commits_from_merge $@)
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

function dssh() {
    CONTAINER_COMMAND=${1:-bash}
    docker exec -it `docker ps | sed -n '1!p' | awk '{print $(NF)}' | fzf | awk '{print $1}'` $CONTAINER_COMMAND
}

function kssh() {
    NAMESPACE=${1}
    CONTAINER_COMMAND=${2:-bash}
    kubectl exec -n ${NAMESPACE} -it `kubectl get pods -n "${NAMESPACE}" | sed -n '1!p' | fzf | awk '{print $1}'` -- $CONTAINER_COMMAND
}

function drst() {
    docker restart `docker ps | sed -n '1!p' | awk '{print $(NF)}' | fzf -m | xargs`
}


function gcip() {
    gco `gipa | fzf | awk '{print $1}'`
}

function gcob() {
    gco `git branch --sort=-committerdate | fzf | awk '{print $1}'`
}

# todo: make it work
function ticket_rebase() {
    BRANCH=${1}
    PREFIX=${2}

    prefixed_message=\"${PREFIX}: $(git show -s --format=%s)\"

    git rebase --no-verify --exec `git commit --no-verify --amend -m "${prefixed_message}"` $BRANCH
}

# function k_scale() {
#     REPLICAS=${1}
#     kubectl -n `kubectl get ns | sed -n '1!p' | fzf -m |  awk '{print $1}' | xargs` scale --replicas $REPLICAS deployment --all
# }
