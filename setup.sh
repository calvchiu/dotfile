#!/bin/bash -x

sudo apt update
sudo apt install curl git zsh vim-gnome tmux silversearcher-ag build-essential cmake python-dev python3-dev xclip ffmpeg default-jdk default-jre maven

sudo apt install i3 i3blocks rofi feh

## zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
# change shell, restart machine afterwords
# chsh -s $(which zsh)

## dotfile
dir=~/dotfile
dotfiles=".vimrc .tmux.conf .gitconfig .gitignore_global .zshrc"

for file in $dotfiles; do
  echo "Symlink created for $file"
  ln -s $dir/$file ~/$file
done

# i3 configs
mkdir -p ~/.config/{i3,i3blocks}
ln -s $dir/.config/i3/config ~/.config/i3/config
ln -s $dir/.config/i3blocks/i3blocks.conf ~/.config/i3blocks/i3blocks.conf

## vim

# font
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
#brew install fontconfig for fc-cache
fc-cache -vf ~/.fonts/

# plugin manager & install plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -i NONE -c PlugInstall -c quitall

