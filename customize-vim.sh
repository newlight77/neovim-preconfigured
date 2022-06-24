#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  Customize ------ ***" 1>&2

DIR=/tmp/bash_custom

if [ ! -d "$DIR" ]; then
  git clone https://github.com/newlight77/bash_custom.git /tmp/bash_custom && cd $DIR
else
  cd $DIR && git pull origin main
fi

echo "creating folder $HOME/.vim_awesome" 1>&2
mkdir -p $HOME/.vim_awesome
echo "creating folder $HOME/.config/nvim for NeoVim" 1>&2
mkdir -p .config/nvim

for (
  file in bash/.bashrc*
) do
  echo "copying $file to $HOME/.vim_awesome/" 1>&2
  cp $file $HOME/.vim_awesome/
done

echo "writing contents of vim/.vimrc-awesome.vim to $HOME/.vimrc" 1>&2
cat vim/.vimrc-awesome.vim                           >> $HOME/.bashrc
echo "writing contents of vim/.vimrc-awesome.vim to $HOME/.config/nvim/init.vim for NeoVim" 1>&2
cat vim/.vimrc-awesome.vim                           >> $HOME/.config/nvim/init.vim

cp  vim/.vim_awesome/general.vim                        $HOME/.vim_awesome/general.vim
cp  vim/.vim_awesome/general-mappings.vim               $HOME/.vim_awesome/general-mappings.vim
cp  vim/.vim_awesome/functions.vim                      $HOME/.vim_awesome/functions.vim
cp  vim/.vim_awesome/filetypes.vim                      $HOME/.vim_awesome/filetypes.vim
cp  vim/.vim_awesome/filetypes-mappings.vim             $HOME/.vim_awesome/filetypes-mappings.vim 
cp  vim/.vim_awesome/plugins.vim                        $HOME/.vim_awesome/plugins.vim
cp  vim/.vim_awesome/plugins-mappings.vim               $HOME/.vim_awesome/plugins-mappings.vim
cp  vim/.vim_awesome/plugins-color-theme.vim            $HOME/.vim_awesome/plugins-color-theme.vim
cat vim/.vimrc-awesome.vim                            > $HOME/.vimrc
cat vim/.vimrc-awesome.vim                            > $HOME/.config/nvim/init.vim


echo "*** ------  Customize Vim/NeoVim Done ------ ***" 1>&2

