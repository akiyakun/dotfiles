#!/bin/sh
# unity_setup.sh
# v1.01

_win () {
  local unity=Unity/Editor/Data/Tools
  _sln $APPDIR/$unity/UnityYAMLMerge.exe $XBIN/UnityYAMLMerge.exe
  if [ $? -eq 1 ] ; then
    _sln $APPDIR_x86/$unity/UnityYAMLMerge.exe $XBIN/UnityYAMLMerge.exe
  fi
}

_mac () {
  local unity=$APPDIR/Unity/Unity.app/Contents/Tools
  if [ -f $unity/UnityYAMLMerge ] ; then
    _sln $unity/UnityYAMLMerge $XBIN/UnityYAMLMerge
  fi
}

_linux () {
  return 0
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
esac

