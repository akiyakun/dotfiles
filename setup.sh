#!/bin/sh

# Make as symbolic link to home directory.
_sln_home () {
  ln -shf $PWD/$1 ~/$1
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
# xbin
# 先に元ファイルの権限を設定後シンボリックリンクを作成
_setup_xbin () {
  echo setup xbin
  SRC=$PWD/xbin
  chmod -R -v a+rx $SRC
  ln -shf $SRC ~/xbin

  echo xetc
  SRC=$PWD/xetc

  # 外部の設定ファイルをDownload & Update
  # completions
  TMP=$SRC/completions
  curl -o $TMP/git-completion.bash \
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
  curl -o $TMP/git-prompt.sh \
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

  chmod -R -v a+rwx $SRC
  ln -shf $SRC ~/xetc


  echo xvar
  # MEMO: xvarっている？
  SRC=$PWD/xvar
  chmod -R -v a+rw $SRC
  ln -shf $SRC ~/xvar

}

_setup_xbin

########################################
# Unity
ln -shf /Applications/Unity/Unity.app/Contents/Tools/UnityYAMLMerge ~/xbin/UnityYAMLMerge



