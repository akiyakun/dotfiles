#!/bin/sh
# vim_setup.sh
# v1.01

if [ ! -d ~/.vim ] ; then
  mkdir ~/.vim
fi

sh ./other/vim/dein_setup.sh


