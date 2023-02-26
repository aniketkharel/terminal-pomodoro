#!/bin/bash

declare -A pomo_options
# represents time in minutes
pomo_options["work"]="55"
pomo_options["break"]="5"
# takes string as an argument work or break
pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  ./timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

# requires alias to be sourced to your .zshrc file
# alias wo="pomodoro 'work'"
# alias br="pomodoro 'break'"
pomodoro $1 # either work or break

# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro
# optional https://github.com/busyloop/lolcat for beautiful rainbows (colored text)
