# .bashrc

##############################
# PATH
#export PATH=$PATH:~/xbin

# xbin
. ~/xbin/.xbinrc

##############################
# Alias
alias ..='cd ..'
alias la='ls -a'
alias lal='ls -alh'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias vi='vim'

# git
alias gs='git status -s'

# docker
alias dk='docker'
alias dkps='docker ps -a'

##############################
# case $TERM in
#   linux) LANG=C ;;
#   *) LANG=ja_JP.UTF-8 ;;
# esac

##############################
# Platforms
case "$OSTYPE" in
msys*)
    echo "WINDOWS"
    PLATFORM='win'
    ;;
darwin*)
    echo "OSX"
    PLATFORM='mac'
    ;;
linux*)
    echo "LINUX"
    PLATFORM='linux'
    ;;
*)
    echo "unknown: $OSTYPE"
    ;;
esac

##############################
# win
if [ "$PLATFORM" = "win" ]; then
export PATH="$PATH:/usr/local/bin:/bin:/mingw64/bin:/X/opt/svn/bin:/x/usr/local/bin"
alias ls='ls --show-control-chars'
alias la='ls -a --show-control-chars'
alias lal='ls -alh --show-control-chars'
fi

##############################
# mac
if [ "$PLATFORM" = "mac" ]; then
#export LSCOLORS=xbfxcxdxbxegedabagacad
alias ls='ls -G'
alias la='ls -a -G'
alias lal='ls -alh -G'
fi

##############################
# linux
if [ "$PLATFORM" = "linux" ]; then
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lak='ls -alh --color=auto'
fi

