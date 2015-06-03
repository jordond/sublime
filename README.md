# Sublime Text 3 Installer

## Installation

Installs Sublime Text 3, and copies over all my Sublime settings.

1. Run `./install.sh`, it will check if Sublime is installed, if not it will install it.
1. When it pauses, open Sublime and install Package Control.
1. Close Sublime Text
1. Press any key and wait for script to symlink config files.
1. Open Sublime Text and wait a little bit while it installs the packages. NOTE hit okay for all warnings.
1. Restart Sublime if necessary.

## Package Control
1. Open Sublime and open terminal.
2. Paste the following and hit enter: 
`import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)`

## Included Scripts
1. Run `./update.sh` to reinstall the latest version of Sublime Text.
2. Run `./uninstall.sh` to uninstall Sublime and remove the binary.
