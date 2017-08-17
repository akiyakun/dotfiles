#!/bin/sh
# setup.sh v1.04
# ./other/*_setup.sh も実行されます。

# Make as symbolic link to home directory.
_sln () {
  if [ -e $1 ] ; then
    if [ -f $1 ] ; then
      # File
      ln -sf $1 $2
    elif [ -d $1 ] ; then
      # Directory
      #ln -sfd $1 $2
      ln -sf $1 $2
    else
      echo "Not a invalid $1"
      return 1
    fi
    return 0
  else
    echo "Not found $1"
    return 1
  fi
}

# Make as symbolic link to home directory.
_sln_home () {
  _sln $PWD/$1 ~/$1
}

# Execute shell script.
_do () {
  if [ -f $1 ] ; then
    sh $1
  fi
}


########################################
# Terminal dotfiles
_sln_home .bash_profile
_sln_home .bashrc
_sln_home .inputrc
_sln_home .screenrc


########################################
# Editor
_sln_home .vimrc
_sln_home .vimrc_local
_sln_home .editorconfig

_sln_home .boostnoterc


########################################
# 一度環境設定ファイルを読み込む
# . ~/.bash_profile "--no-bashrc"
sh ~/.bash_profile --no-bashrc


########################################
# xbin
# 先に元ファイルの権限を設定後シンボリックリンクを作成
_setup_xbin () {
  echo xbin setup...
  SRC=$PWD/xbin
  chmod -R a+rx $SRC
  rm -f ~/xbin
  _sln $SRC ~/xbin

  echo xetc setup...
  SRC=$PWD/xetc
  chmod -R a+rwx $SRC
  rm -f ~/xetc
  _sln $SRC ~/xetc

  echo xvar setup...
  SRC=$PWD/xvar
  chmod -R a+rwx $SRC
  rm -f ~/xvar
  _sln $SRC ~/xvar

}

_setup_xbin


########################################
# completion
_sln_home .bash_completion


########################################
# Setup Others
_do ./other/completion_setup.sh
_do ./other/git_setup.sh
_do ./other/vim_setup.sh
_do ./other/unity_setup.sh

