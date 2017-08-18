#!/bin/sh
# .bash_profile
# Ver 1.03

##############################
# path
export PATH=$PATH:/usr/local/bin

# Platforms
echo $OSTYPE
case "$OSTYPE" in
msys*) # win
  APPDIR=C:/Program Files
  APPDIR_x86='C:/Program Files (x86)'
;;
darwin*) # mac
  APPDIR=/Applications
;;
linux*) # linux
  # とりあえずHomeに設定
  APPDIR=~/
;;
esac


##############################
# xbin
export XBIN=~/xbin
export XETC=~/xetc
export XVAR=~/xvar
export XTEMP=$XVAR/temp
export PATH=$PATH:$XBIN:$XETC:$XVAR:$XTEMP


##############################
# Load .bashrc
# if [ $1 != "--no-bashrc" ]; then
if [ $# -eq 0 ]; then
  if [ -f ~/.bashrc ]; then
    echo "Load .bashrc"
    . ~/.bashrc
  fi
fi

