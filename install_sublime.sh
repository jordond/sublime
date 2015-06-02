#!/bin/sh

# Sublime Text 3 install with Package Control (last update: 4 April 2015)
#
# No need to download this script, just run it on your terminal:
#
# Grabbed from https://gist.github.com/simonewebdesign/8507139

if [ ! -z "$1" ]; then
  INSTALLATION_DIR=$1
else
  INSTALLATION_DIR="/opt/sublime_text"
fi

# Detect the architecture
if [ "$(uname -m)" = "x86_64" ]; then
  ARCHITECTURE="x64"
else
  ARCHITECTURE="x32"
fi

# Fetch the latest build version number (thanks daveol)
BUILD=$(echo $(curl http://www.sublimetext.com/3) | sed -rn "s#.*The latest build is ([0-9]+)..*#\1#p")

URL="http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_{$BUILD}_{$ARCHITECTURE}.tar.bz2"


# Download the tarball, unpack and install
curl -o $HOME/st3.tar.bz2 $URL
if tar -xf $HOME/st3.tar.bz2 --directory=$HOME; then
  # Remove the installation folder and the symlink, they might already exist
  sudo rm -rf $INSTALLATION_DIR /bin/subl
  sudo mv $HOME/sublime_text_3 $INSTALLATION_DIR
  sudo ln -s $INSTALLATION_DIR/sublime_text /bin/subl
fi
rm $HOME/st3.tar.bz2


# Package Control - The Sublime Text Package Manager: https://sublime.wbond.net
# curl -o $HOME/Package\ Control.sublime-package https://sublime.wbond.net/Package%20Control.sublime-package
# sudo mv $HOME/Package\ Control.sublime-package "$INSTALLATION_DIR/Packages/"


# Add to applications list (thanks 4ndrej)
sudo ln -s $INSTALLATION_DIR/sublime_text.desktop /usr/share/applications/sublime_text.desktop

echo ""
echo "Sublime Text 3 installed successfully!"
