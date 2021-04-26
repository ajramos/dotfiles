#!/bin/bash

# copy other dot files 
cp -v $HOME/{.zshrc,.vimrc,.tmux.conf,.robomongorc.js} .
cp -v $HOME/.gitconfig .
cp -v $HOME/.config/nvim/init.vim ./.config/nvim/
cp -v $HOME/.config/kitty/kitty.conf ./.config/kitty/

#Copy fonts
cp -vr $HOME/.local/share/fonts ./.local/share/fonts

# push to Github
git add -u;
git commit -m "New backup `date +'%Y-%m-%d %H:%M'`";
git push origin main;
