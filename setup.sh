#!/bin/sh
# setup.sh
# ./other/*_setup.sh も実行されます。

# Make as symbolic link to home directory.
_sln () {
  if [ -f $1 ] ; then
    ln -shf $1 $2
    return 0
  else
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
_sln_home .bash_completion
_sln_home .inputrc
_sln_home .screenrc

########################################
# Editor
_sln_home .vimrc
_sln_home .vimrc_local
_sln_home .editorconfig

_sln_home .boostnoterc


########################################
# 一度bashの設定ファイルを読み込む
. ~/.bash_profile
#. ~/.bashrc


########################################
# xbin
# 先に元ファイルの権限を設定後シンボリックリンクを作成
_setup_xbin () {
  echo xbin
  SRC=$PWD/xbin
  chmod -R -v a+rx $SRC
  _sln $SRC ~/xbin

  echo xetc
  SRC=$PWD/xetc
  chmod -R -v a+rwx $SRC
  _sln $SRC ~/xetc

  echo xvar
  SRC=$PWD/xvar
  chmod -R -v a+rwx $SRC
  _ln $SRC ~/xvar

}

_setup_xbin


########################################
# Setup Others
_do ./other/git_setup.sh
_do ./other/vim_setup.sh
_do ./other/unity_setup.sh

