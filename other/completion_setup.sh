#!/bin/sh
# completion_setup.sh
# v1.00

echo 'Install completion...'

CMP=$XETC/completions

# コマンドとして登録されないからifが使えないけど、まあいいか
which complete > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo 'Installed completion_setup.sh.'
else
    apt install -y bash-completion
    #command -v complete
fi

# 1  ファイル名
# 2  URI
_dl () {
  if [ ! -f "$CMP/$1" ] ; then
    echo "dl $1"
    curl -o $CMP/$1 $2
  fi
}

# Download by completion files.
# .gitignore にも追加してください。
# .bash_completion にも追加してください。
_dl git-completion.bash "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
#_dl git-prompt.sh "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

