#!/bin/bash
sudo apt-get install git
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
#brew install fontconfig for fc-cache
fc-cache -vf ~/.fonts/
