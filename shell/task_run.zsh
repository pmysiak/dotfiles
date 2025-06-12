#!/usr/bin/zsh

task_run() {
  task "$1" -- "${@:2}"
}

