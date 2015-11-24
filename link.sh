#!/bin/bash
dir=~/dotfile
files=".vimrc .tmux.conf"

for file in $files; do
	echo "Symlink created for $file"
	ln -s $dir/$file ~/$file
done
