
# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME
export PATH=$HOME/bin:/usr/local/bin:$PATH

RED='\033[0;31m'
NC='\033[0m' # No Color

ANTIGEN=/usr/share/zsh/share/antigen.zsh

if [[ ! -a $ANTIGEN ]]
then
  echo "${RED}WARNING! Antigen package package not installed. Abort.${NC}"
  return 1
fi

source $ANTIGEN

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-extras
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found

# Some NodeJS specific bundle
antigen bundle lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-nvm

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

