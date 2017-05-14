#!/bin/bash

# Text color variables
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Red
bldblu=${txtbld}$(tput setaf 4) # Blue
bldwht=${txtbld}$(tput setaf 7) # White
txtrst=$(tput sgr0)             # Reset

info() {
  echo ${bldblu}▶ "$1"${txtrst}
}

error() {
  echo
  echo ${bldred}✗ "$1"${txtrst}
}

die() {
  error "$1"
  exit 1
}

if ! [ -x "$(command -v brew)" ]
then
  die "Please install Homebrew (https://brew.sh/) first. Aborting."
fi

info "Installing packages..."
  brew update && brew install npm terraform transcrypt

info "Installing hubot..."
  npm install -g yo generator-hubot


info "Setup complete. Follow steps in the README to proceed. You may fire when ready captain."
exit 0
