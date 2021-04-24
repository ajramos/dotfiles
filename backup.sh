#!/bin/bash
cd $HOME/dev/dotfiles
# check to see is git command line installed in this machine
IS_GIT_AVAILABLE="$(git --version)"
if [[ $IS_GIT_AVAILABLE == *"version"* ]]; then
  echo "Git is Available"
else
  echo "Git is not installed"
  exit 1
fi

# copy other dot files 
cp  $HOME/{.zshrc,.vimrc,.tmux.conf,.robomongorc.js} .
cp  $HOME/.gitconfig .
cp  $HOME/.config/nvim/init.vim ./.config/nvim/


# Check git status
gs="$(git status | grep -i "modified")"
# echo "${gs}"

# If there is a new change
if [[ $gs == *"modified"* ]]; then
  echo "push"
fi

# push to Github
git add -u;
git commit -m "New backup `date +'%Y-%m-%d'`";
git push origin main
