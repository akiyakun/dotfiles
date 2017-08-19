# .bashrc
# Ver 1.04

##############################
# PATH
#export PATH=$PATH:~/xbin

# yarn
# export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin/"
# export PATH="$PATH:`yarn global bin`"

##############################
# Alias
alias ..='cd ..'
alias la='ls -a'
alias lal='ls -alh'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -rf -i'

# Screen
alias screen-clean='screen -ls | grep Detached | awk "{ print $1}"| xargs -L 1 -I % screen -S % -X quit'

# vi
alias vi='vim'

# git
alias gs='git status -s'
alias gb='git branch'
# カレントブランチ名を取得
alias gbc='git symbolic-ref --short HEAD'
# カレントブランチをpush
gpush () {
  command git push $1 "$(gbc):$(gbc)"
}

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


##############################
# 2回Ctrl+Dを無視する
IGNOREEOF=2
export IGNOREEOF


echo $TERM
#xterm
#screen
# case $TERM in
#   linux) LANG=C ;;
#   *) LANG=ja_JP.UTF-8 ;;
# esac

# Mac?
export LANG=ja_JP.UTF-8

# ファイル名補完の除外設定
export FIGNORE=${FIGNORE}:Thumbs.db:.DS_Store
export FIGNORE=${FIGNORE}:.svn:.git:.meta


##############################
# completion
case "$OSTYPE" in
msys*) # win
;;
darwin*) # mac
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
;;
linux*) # linux
;;
esac

if [ -f ~/.bash_completion ]; then
  . ~/.bash_completion
fi


##############################
# Windows
_win () {
  echo "Windows"

  export PATH="$PATH:/usr/local/bin:/bin:/mingw64/bin:/X/opt/svn/bin:/x/usr/local/bin"
  alias ls='ls --show-control-chars'
  alias la='ls -a --show-control-chars'
  alias lal='ls -alh --show-control-chars'
}


##############################
# macOS
_mac () {
  echo "macOS"

  #export LSCOLORS=xbfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -a -G'
  alias lal='ls -alh -G'

}


##############################
# Linux
_linux () {
  echo "Linux"

  # ssh
  alias ssh-agent='eval `command ssh-agent`'
  # > known_hosts
  ssh-agent
  ssh-add ~/.ssh/id_akiya_rsa


  # termux
  export PATH="$PATH:$HOME/bin"
  # export PATH="$PATH:/data/data/com.termux/files/usr/bin"
  # export PATH="$PATH:/data/data/com.termux/files/home/.npm"

  alias su=''
  alias sudo=''

  # push前にlfsに明示的にpushを追加
  gpush () {
    echo "lfs push"
    git lfs push $1 $(gbc)
    command git push $1 "$(gbc):$(gbc)"
  }

  # go
  export GOPATH="$HOME/go"
  #export GOROOT="$HOME/go"
  #export PATH="$PATH:/data/data/com.termux/files/usr/bin"
  #export GOPATH="/data/data/com.termux/files/usr/lib/go"
  #export GOROOT="/sdcard1/Android/media/com.termux/dev/git-lfs"
  export GOROOT="/data/data/com.termux/files/usr/lib/go"
  export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

  alias cddev='cd /sdcard1/Android/media/com.termux/dev/'

  alias ls='ls --color=auto'
  alias la='ls -a --color=auto'
  alias lak='ls -alh --color=auto'


  # nvm
  #export NVM_DIR="$HOME/.nvm"
  #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  #[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

}


##############################
# Platforms
case "$OSTYPE" in
msys*)
  _win
;;
darwin*)
  _mac
;;
linux*)
  _linux
;;
*)
  echo "Unknown: $OSTYPE"
  ;;
esac

