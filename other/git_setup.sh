#!/bin/sh
# git_setup.sh

# completions
CMP=$XETC/completions
curl -o $CMP/git-completion.bash \
  "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
curl -o $CMP/git-prompt.sh \
  "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"


