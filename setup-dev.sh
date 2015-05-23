#!/bin/bash
# Simple setup sh for configuring developer environment

sudo apt-get install -y git gitk git-gui \
    tmux guake vim emacs htop tree curl \
    build-essential

mkdir $HOME/{bin,apps,clones}
## export PATH=$PATH:$HOME/bin
# I think this should be at .profile
## set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi
ln -s Desktop desk
ln -s Downloads down

cd $HOME/clones

# solarized guake
git clone https://github.com/coolwanglu/guake-colors-solarized
./guake-colors-solarized/set_light.sh

# lein
cd $HOME/bin
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 lein

# ~/bin

#############
# dotfiles section

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/duot/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

ln -sf dotfiles/emacs-live .emacs.d
ln -sb dotfiles/.emacs-live.el .

ln -sb dotfiles/.tmux-solarized.conf .tmux.conf
ln -sb dotfiles/.vimrc .
ln -sf dotfiles/.vim .

ln -sb dotfiles/.xmodmaprc .
cp dotfiles/bin/swapcapsalt bin/
swapcapsalt
