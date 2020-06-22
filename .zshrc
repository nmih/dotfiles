# Path to your oh-my-zsh installation.
export ZSH="/home/nathan/.oh-my-zsh"

ZSH_THEME="materialshell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Ctrl-R for history search
bindkey '^R' history-incremental-search-backward

# [WSL] Home dir
# cd /home/mih

# Change ls colours
LS_COLORS="ow=01;36" && export LS_COLORS

# Nathan's aliases
cs() { cd "$1" && ls -lh; }

# [200419] docker ps -a with options to show different things
# https://github.com/moby/moby/issues/7477
# Default is {{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}
alias dpsa='docker ps -a --format="table {{.Names}}\t{{.Image}}\t{{.Status}}"'
# [200424] Docker conveniences
alias docker-rebuild='docker-compose down && docker-compose build --no-cache && docker-compose up'

# [200419] https://unix.stackexchange.com/questions/25327/watch-command-alias-expansion
# Use this in combination with dpsa to get a live updating container status view
function watcha {
    watch $(alias "$@" | cut -d\' -f2)
}

PATH=$PATH:~/.local/bin