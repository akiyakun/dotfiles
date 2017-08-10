# .bash_profile

##############################
# PATH
export PATH=$PATH:/usr/local/bin

##############################
# xbin
export XBIN=~/xbin
export XETC=~/xetc
export XVAR=~/xvar
export XTEMP=$XVAR/temp
export PATH=$PATH:$XBIN:$XETC:$XVAR:$XTEMP

##############################
# 2回Ctrl+Dを無視する
IGNOREEOF=2
export IGNOREEOF

##############################
# Load bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

##############################
# Load .bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

