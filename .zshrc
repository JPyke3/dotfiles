#  ____        _             _       ____        _       
# |  _ \ _   _| | _____  ___( )___  |  _ \  ___ | |_ ___ 
# | |_) | | | | |/ / _ \/ _ \// __| | | | |/ _ \| __/ __|
# |  __/| |_| |   <  __/  __/ \__ \ | |_| | (_) | |_\__ \
# |_|    \__, |_|\_\___|\___| |___/ |____/ \___/ \__|___/
#        |___/                                           


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"

# Left Propt Elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir vcs)

# Uncommented Configs
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# ZSH Plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias emacs='emacs -nw'
alias cd='pushd'
alias 'cd ..'='popd'

# 100% Necissary
autoload -Uz tetriscurses
alias tetris=tetriscurses
