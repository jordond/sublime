#!/bin/bash

# Sublime Text 3 - Settings script

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SUBLIME_INSTALL_DIR="/opt/sublime_text"
CONFIG_DIR="$HOME/.config/sublime-text-3/Packages/User"

function sublime_is_installed {
 if ! check="$(type -p "subl")" || [ -z "$check" ]; then
    return 1
  else
    return 0
 fi
}

function init {
  sublime_is_installed
  if [[ $? -eq 1 ]]; then
    echo "Sublime not found, installing now."
    ./install_sublime.sh $SUBLIME_INSTALL_DIR
    echo ""
  fi
  
  echo "Open sublime and install package control."
  echo -n "Press any key to continue..."
  read waitforme
  setup
}

function setup {
  if [ -d "$CONFIG_DIR" ]; then
    echo ""
    echo "Removing old config directory..."
    rm -rf $CONFIG_DIR
  fi

  echo ""
  echo "Symlinking new config files"
  ln -sv "$DIR/Packages/User/" $CONFIG_DIR

  echo ""
  echo "Setup is done, open sublime, wait, and restart."
}

init
