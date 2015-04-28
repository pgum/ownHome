#!/bin/bash

configsNamePattern=ownHome/[B,V,b,v]*rc
mkdir ~/.Bashrc ~/.Vimrc

ln -s -t ~/.Bashrc/ ~/ownHome/Bashrc/*
ln -s -t ~/.Vimrc/ ~/ownHome/Vimrc/*
ln -s ~/ownHome/vimrc ~/.vimrc
ln -s ~/ownHome/bashrc ~/.bashrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c"PluginInstall" -c"qa"
