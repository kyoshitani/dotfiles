#!/bin/sh
DOTFILES=(.vim .vimrc .dein.toml .dein_lazy.toml .tmux .tmux.conf .zshrc .zprofile .agignore .zprofile .bashrc .bash_profile .git .gitconfig .tigrc .config/peco/config.json)

for file in ${DOTFILES[@]}
do
  ln -fnsv $HOME/dotfiles/$file $HOME/$file
done
