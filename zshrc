# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME
export PATH=$HOME/bin:/usr/local/bin:$PATH

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Secrets in Git
antigen bundle StackExchange/blackbox

# Tell Antigen that you're done.
antigen apply

