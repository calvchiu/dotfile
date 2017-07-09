#!/bin/bash -x

sudo apt-get update
sudo apt-get install curl git zsh vim tmux silversearcher-ag build-essential cmake python-dev python3-dev


## zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
# change shell, restart machine afterwords
# chsh -s $(which zsh)

## dotfile
dir=~/dotfile
dotfiles=".vimrc .tmux.conf .gitconfig .zshrc"

for file in $dotfiles; do
  echo "Symlink created for $file"
  ln -s $dir/$file ~/$file
done


## vim

# font
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
#brew install fontconfig for fc-cache
fc-cache -vf ~/.fonts/

# plugin manager and plugin dependencies
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install plugin
vim -i NONE -c VundleUpdate -c quitall
~/.vim/bundle/YouCompleteMe/install.py --clang-completer

## i3wm
