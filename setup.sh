#!/bin/bash
sudo apt-get install vim tmux

## vim

# font
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
#brew install fontconfig for fc-cache
fc-cache -vf ~/.fonts/

# dotfile
dir=~/dotfile
dotfiles=".vimrc .tmux.conf .gitconfig"

for file in $dotfiles; do
  echo "Symlink created for $file"
  ln -s $dir/$file ~/$file
done

# plugin manager
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugin
vim -i NONE -c VundleUpdate -c quitall


## i3wm
