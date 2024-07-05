#!/bin/bash

# Setup script for setting up a new macos machine
echo "Starting setup"
# install xcode CLI
xcode-select --install &> /dev/null

# Wait until XCode Command Line Tools installation has finished
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done

# Ask for the administrator password upfront
echo -e "${msc}Administrator password${endcolor}"
sudo -v

# Keep-alive: update existing `sudo` time stamp until mac_setup has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make shell find brew
# (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zshrc
# (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
brew update

# install packages and casks
brew bundle --force --file macos_Brewfile

# Homebrew cleanup
echo "Cleaning up homebrew installation..."
brew cleanup

# Install additional tools
# vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Clone dotfiles and run gnu stow
cd $HOME
git clone https://github.com/icervenka/dotfiles.git
cd dotfiles
make

# Stow cleanup
rm ~/Makefile

echo "Setup completed!"

