#!/bin/sh

# Terminal
ln -shf $PWD/.bash_profile ~/.bash_profile
ln -shf $PWD/.bashrc ~/.bashrc
ln -shf $PWD/.inputrc ~/.inputrc
ln -shf $PWD/.screenrc ~/.screenrc

# Vim
ln -shf $PWD/.vimrc ~/.vimrc
ln -shf $PWD/.vimrc_local ~/.vimrc_local

# xbin
# 先に元ファイルの権限を設定後リンクを作成
chmod -R -v a+rx $PWD/xbin
chmod -R -v a+w $PWD/xbin/etc
chmod -R -v a+w $PWD/xbin/var
chmod -R -v a+w $PWD/xbin/temp
ln -shf $PWD/xbin ~/xbin

# Unity
ln -shf /Applications/Unity/Unity.app/Contents/Tools/UnityYAMLMerge ~/xbin/UnityYAMLMerge



