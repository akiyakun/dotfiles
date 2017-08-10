# .bashrc

##############################
# PATH
#export PATH=$PATH:~/xbin


##############################
# Alias
alias ..='cd ..'
alias la='ls -a'
alias lal='ls -alh'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Screen
alias screen-clean='screen -ls | grep Detached | awk "{ print $1}"| xargs -L 1 -I % screen -S % -X quit'

# vi
alias vi='vim'

# git
alias gs='git status -s'

# docker
alias dk='docker'
alias dkps='docker ps -a'


##############################
# Terminal
export PS1="/\W$ "

# プロンプトに各種情報を表示
# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWUPSTREAM=1
# GIT_PS1_SHOWUNTRACKEDFILES=
# GIT_PS1_SHOWSTASHSTATE=1kk
# export PS1="/\W$ $(__git_ps1) "

# case $TERM in
#   linux) LANG=C ;;
#   *) LANG=ja_JP.UTF-8 ;;
# esac

# Mac?
export LANG=ja_JP.UTF-8

# ファイル名補完の除外設定
export FIGNORE=${FIGNORE}:.DS_Store
export FIGNORE=${FIGNORE}:.svn:.git:.meta

# completion
if [ -f ~/.bash_completion ]; then
  . ~/.bash_completion
fi


##############################
# win
#if [ "$PLATFORM" = "win" ]; then
#fi

##############################
# Platforms
case "$OSTYPE" in
#-------------------
# Windows
msys*)
  echo "Windows"

  export PATH="$PATH:/usr/local/bin:/bin:/mingw64/bin:/X/opt/svn/bin:/x/usr/local/bin"
  alias ls='ls --show-control-chars'
  alias la='ls -a --show-control-chars'
  alias lal='ls -alh --show-control-chars'
;;
#-------------------
# macOS
darwin*)
  echo "macOS"

  #export LSCOLORS=xbfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -a -G'
  alias lal='ls -alh -G'
;;
#-------------------
# Linux
linux*)
  echo "Linux"

  alias ls='ls --color=auto'
  alias la='ls -a --color=auto'
  alias lak='ls -alh --color=auto'
;;
#-------------------
*)
  echo "Unknown: $OSTYPE"
  ;;
esac


