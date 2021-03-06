#!/bin/bash

########## Variables

olddir=~/dotfiles_old             # old dotfiles backup directory
dir=~/code/dotfiles                # dotfiles directory
files="zshrc tmux.conf"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "[*] Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "[*] Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "[*] Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "[*] Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo '[*] Copying init.vim -> ~/.config/nvim/init.vim' &&\
mkdir -p ~/.config/nvim/ &&\
cp init.vim ~/.config/nvim/
