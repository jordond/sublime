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
    $DIR/bin/sublime_install.sh $SUBLIME_INSTALL_DIR
    echo ""
  fi

  echo "Open sublime and install package control."
  subl
  echo -n "Press 'c' to show the install command, or any key to continue... "
  read waitforme
  if [[ $waitforme == "c" ]]; then
    packageControl
  else
    setup
  fi
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

function packageControl {
  echo "====================================================================="
  echo ""
  echo "import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)"
  echo ""
  echo "====================================================================="
  echo ""
  echo -n "Press any key to continue... "
  read waiting
  setup
}

init
