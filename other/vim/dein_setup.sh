#!/bin/sh
# dein_setup.sh
# v1.00
#
# Open vim and install dein
# :call dein#install()

DEIN_DIR=~/.vim/dein

if [ ! -d $DEIN_DIR ] ; then
  mkdir $DEIN_DIR

  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh \
    > $DEIN_DIR/installer.sh

  sh $DEIN_DIR/installer.sh $DEIN_DIR
fi

