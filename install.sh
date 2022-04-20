#!/bin/sh

# Install Unix dependencies
sudo wget -q https://apt.thoughtbot.com/thoughtbot.gpg.key -O /etc/apt/trusted.gpg.d/thoughtbot.gpg
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install -y silversearcher-ag rcm tmux vim

# Clone thoughtbot's dotfiles
git clone --depth 1 git@github.com:thoughtbot/dotfiles.git ~/dotfiles
git clone --depth 1 git@github.com:purinkle/dotfiles.git ~/dotfiles-local

# Install the dotfiles
env RCRC="$HOME/dotfiles/rcrc" rcup -f
