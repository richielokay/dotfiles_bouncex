sudo gem install compass

#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php

brew install php54-apc
brew install imagemagick
brew install php54-curl
brew install php54-imagick

brew install curl

#Install Bouncex version of MYSQL
brew tap homebrew/versions
brew install homebrew/versions/mysql51

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

installcask github
installcask gitx
installcask gitbox
installcask tower
installcask iterm2
installcask macvim
installcask mysql-workbench
installcask sequel-pro
installcask sublime-text
installcask the-unarchiver
installcask transmission
installcask chrome
installcask firefox

# Remove outdated versions from the cellar
brew cleanup

# Setup MYSQL to launch and restart

echo "unset TMPDIR mysql_install_db"
echo "ln -sfv /usr/local/opt/mysql51/*.plist ~/Library/LaunchAgents"
echo "launchctl load ~/Library/  LaunchAgents/homebrew.mxcl.mysql51.plist"
echo "mysql.server start"
