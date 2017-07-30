export PATH="/usr/local/bin:/bin:/mingw64/bin:/X/opt/svn/bin:/x/usr/local/bin"
# Other
export PATH="$PATH:/D/opt/Oracle/VirtualBox:/d/opt/Vagrant/bin:/d/opt/Python27:/D/opt/Microsoft Visual Studio 12.0/VC/bin"
# SCE
export PATH="$PATH:/d/opt/SCE/Common/SceVSI-VS14/bin"
# Local
export PATH="$PATH:/i/tools"

#export INCLUDE="$INCLUDE:/D/opt/Microsoft Visual Studio 12.0/VC/include"
#export LIBPATH="$LIBPATH:/D/opt/Microsoft Visual Studio 12.0/VC/lib"
#export LIBPATH="$LIBPATH:/D/opt/Microsoft Visual Studio 12.0/VC/lib:/C/Program Files (x86)/Windows Kits/8.1/lib/winv6.3/umax86"
#export LIB="$LIB:/D/opt/Microsoft Visual Studio 12.0/VC/lib:/C/Program Files (x86)/Windows Kits/8.1/lib/winv6.3/umax86"
#export LIB="$LIB:/C/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Lib"
#export msvc_deps_prefix="$INCLUDE"

#export LESS=-q

alias ls='ls -a --show-control-chars'

alias cdvm='cd /d/dev/vm/Vagrant/debian'
alias cdprj='cd /i/'
alias vsrun='VisualStudioController.exe debugrun -t I:/premake/qt/vcproj/qt.sln -p qt -bc Debug -pf Win64'
alias vsstop='VisualStudioController.exe stopdebugrun -t I:/premake/qt/vcproj/qt.sln -p qt -bc Debug -pf Win64'
alias premake='premake5'
alias vsbuild='vs14build ./vcproj/qt.sln /build "Debug|Win64" /sn-dbs'


case $TERM in
  linux) LANG=C ;;
  *) LANG=ja_JP.UTF-8 ;;
esac

