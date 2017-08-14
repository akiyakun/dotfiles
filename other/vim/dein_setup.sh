#!/bin/sh
# dein_setup.sh

DEIN_DIR=~/.vim/dein
mkdir $DEIN_DIR

cd $DEIN_DIR

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh $DEIN_DIR/installer.sh $DEIN_DIR

# Open vim and install dein
#:call dein#install()

