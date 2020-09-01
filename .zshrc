# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Uncommented Configs
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# ZSH Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Aliases
alias emacs='emacs -nw'
alias cd='pushd'
alias 'cd ..'='popd'
