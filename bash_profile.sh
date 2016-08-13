# First things first, set the color theme so there's no terrible flash
BASE16_SHELL=$HOME/soft/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Add ~/bin to PATH
PATH+=':$HOME/bin'

# Include homebrew github api token
[[ -e "$HOME/.homebrew_github_api_token.sh" ]] && source ~/.homebrew_github_api_token.sh

# brew editor
export HOMEBREW_EDITOR='atom -w'

# brew cask, app directory to applications for speeding up
# https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Brew bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	    || complete -o default -o nospace -F _git g

alias g=git
alias v=nvim
alias vim=nvim

# set bash prompt
# fancy ps1
# export PS1='$([ $(id -u) -eq 0 ] && echo \[\e[31m\] || echo \[\e[34m\])\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\]:\[\e[2m\]\w\[\e[0m\]$ '
# minimal ps1
export PS1='$([ $(id -u) -eq 0 ] && echo "\[\e[31m\]#\[\e[0m\]")\[\e[34m\]\w\[\e[37;2m\]:\[\e[0m\] '
export PS2='\[\e[33m\]>\[\e[0m\]'

# make ls pretty
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# make grep pretty
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;30;40'

