#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.cache/nvim

DIR=$HOME/.config/nvim

if [ -d $HOME/.config/nvim  ]; then
  echo "making backup of .config/nvim" 1>&2
  mv $HOME/.config/nvim           $HOME/.config/nvim.$(date +"%Y%m%d%H%M%S")
fi


if [ ! -d "$DIR" ]; then
  echo "cloning nvim-preconfigured to $DIR" 1>&2
  git clone https://github.com/newlight77/neovim-preconfigured.git $DIR
else
  cd $DIR && git pull origin main
fi


echo "*** ------  Customize NeoVim Done ------ ***" 1>&2

