# .bash_profile

##############################
# PATH


##############################
# xbin
export XBIN=~/xbin
export XBIN_ETC=~/xbin/etc
export XBIN_VAR=~/xbin/var
export XBIN_TEMP=~/xbin/temp
export PATH=$PATH:$XBIN


##############################
# Load .bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

