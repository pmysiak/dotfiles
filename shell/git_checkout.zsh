#!/usr/bin/zsh

git_checkout() {
    local branch="$1"

    if [[ "$1" == "d" ]]; then
        branch="develop"
    fi

    if [[ "$1" == "s" ]]; then
        branch="staging"
    fi

    if [[ "$1" == "t" ]]; then
        branch="testing"
    fi

    if [[ "$1" == "m" ]]; then
        branch="main"

        if ! is_git_branch_exists "main"; then
            branch="master"
        fi
    fi

    if is_git_branch_exists $branch; then
        git checkout "$branch"
        return
    fi

    git checkout "$@"
}

is_git_branch_exists() {
    local branch="$1"

    if git show-ref --verify --quiet refs/heads/$1; then
        return 0
    fi

    if git show-ref --verify --quiet refs/remotes/origin/$branch; then
        return 0
    fi

    return 1
}

compdef _git git_checkout=git-checkout
