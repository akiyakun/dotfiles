# .bashrc
export PATH=$PATH:~/dev


alias ..='cd ..'
alias la='ls -a'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# git
alias gs='git status -s'

# docker
alias dk='docker'



# case $TERM in
#   linux) LANG=C ;;
#   *) LANG=ja_JP.UTF-8 ;;
# esac


#  Platforms
case "$OSTYPE" in
msys*)
#    echo "WINDOWS"
    
    export PATH="/usr/local/bin:/bin:/mingw64/bin:/X/opt/svn/bin:/x/usr/local/bin"
    alias ls='ls --show-control-chars'
    alias la='ls -a --show-control-chars'

    ;;
darwin*)
#    echo "OSX"

#   export LSCOLORS=xbfxcxdxbxegedabagacad
    alias ls='ls -G'
	alias la='ls -a -G'
    ;;
linux*)
#    echo "LINUX"
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    ;;
*)
    echo "unknown: $OSTYPE"
    ;;
esac
