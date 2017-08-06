# .bash_profile

##############################
# PATH
export PATH=$PATH:/usr/local/bin

##############################
# xbin
export XBIN=~/xbin
export XBIN_ETC=~/xbin/etc
export XBIN_VAR=~/xbin/var
export XBIN_TEMP=~/xbin/temp
export PATH=$PATH:$XBIN

##############################
# 2回Ctrl+Dを無視する
IGNOREEOF=2
export IGNOREEOF

##############################
# Load .bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

