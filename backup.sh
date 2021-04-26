#!/bin/bash

# copy other dot files 
cp  $HOME/{.zshrc,.vimrc,.tmux.conf,.robomongorc.js} .
cp  $HOME/.gitconfig .
cp  $HOME/.config/nvim/init.vim ./.config/nvim/
cp  $HOME/.config/kitty/kitty.conf ./.config/kitty/

# push to Github
git add -u;
git commit -m "New backup `date +'%Y-%m-%d'`";
git push origin main;
