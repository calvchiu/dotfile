#!/bin/bash -x

# optional
#sudo apt remove vim-tiny vim-common vim-gui-common vim-gnome

sudo apt update
sudo apt install ncurses-dev

git clone --depth=1 https://github.com/vim/vim.git ~/vim-source

cd ~/vim-source
./configure --with-features=huge \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu
make
sudo make install
