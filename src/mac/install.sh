#!/usr/bin/env bash

echo -e "Installing Xcode..."
xcode-select --install

echo -e "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo -e "Installing Gettext..."
brew install gettext
ln -s /usr/local/opt/gettext/bin/envsubst /usr/local/bin/envsubst

echo -e "Installing Bash completion..."
brew install bash-completion
brew tap homebrew/completions

if [ "$CHROME_INSTALL" == "1" ]; then
    echo -e "Installing Chrome..."
    brew cask install google-chrome
fi

if [ "$GIT_INSTALL" == "1" ]; then
    echo -e "Installing Git..."
    brew install git
fi

if [ "$GPG_SUITE_INSTALL" == "1" ]; then
    echo -e "Installing GPG Suite..."
    brew install gpgtools
fi

if [ "$DOCKER_INSTALL" == "1" ]; then
    echo -e "Installing Docker..."
    brew cask install docker
fi

if [ "$VIRTUALBOX_INSTALL" == "1" ]; then
    echo -e "Installing Virtualbox..."
    brew cask install virtualbox
fi

if [ "$VAGRANT_INSTALL" == "1" ]; then
    echo -e "Installing Vagrant..."
    brew cask install vagrant
    brew cask install vagrant-manager
fi

if [ "$PHP_INSTALL" == "1" ]; then
    echo -e "Installing PHP..."
    brew tap homebrew/dupes
    brew tap homebrew/versions
    brew tap homebrew/homebrew-php
    brew install php71
fi

if [ "$COMPOSER_INSTALL" == "1" ]; then
    echo -e "Installing Composer..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    composer self-update
fi

if [ "$PHPSTORM_INSTALL" == "1" ]; then
    echo -e "Installing PHPStorm..."
    brew cask install phpstorm
fi

if [ "$MYSQL_WORKBENCH_INSTALL" == "1" ]; then
    echo -e "Installing MySQL Workbench..."
    brew cask install mysqlworkbench
fi

if [ "$POEDIT_INSTALL" == "1" ]; then
    echo -e "Installing Poedit..."
    brew cask install poedit
fi

if [ "$POSTMAN_INSTALL" == "1" ]; then
    echo -e "Installing Postman..."
    brew cask install postman
fi
