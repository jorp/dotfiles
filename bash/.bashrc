# jorp's .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export TERM=xterm-256color
export HISTCONTROL=ignoreboth
export HISTSIZE=
export HISTFILESIZE=
export EDITOR=vim
export VISUAL=$EDITOR
# rainbox ps1 with $?
export PS1="\$? \[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export DAYS_UNTIL=$(expr '(' $(date -d 2021/04/23 +%s) - $(date +%s) + 86399 ')' / 86400)

# XDG base user directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# configuration relocation
## go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"
## aws
# not yet tested
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
## ansible
# not yet working
#export ANSIBLE_HOME="$HOME/$XDG_DATA_HOME/ansible"

alias ls="ls -lahN --color"
alias getclip="xclip -selection c -o"
alias setclip="xclip -selection c "
alias bashrc="vim ~/.bashrc"
alias reload_bashrc="source ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias grep="grep --color"
alias paux="ps aux | grep -i $1"
alias desktop_proxy="ssh -D 1337 -q -C -N -f jorp@desktop"
alias units="units --history $XDG_DATA_HOME/units_history"

# colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
export LESS+='-M -R'
export MANPAGER='less +Gg'

# use FZF mappings & options if installed
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

# include bash functions
[ -f ~/.bash_functions ] && source ~/.bash_functions

# set term title
# --> dirty shell, blocks scp, rsync, etc.
#trap 'echo -ne "\033]2;$(history 1 | sed "s/^[0-9 ]* \+//")\007"' DEBUG

# use thefuck: https://github.com/nvbn/thefuck
#eval $(thefuck --alias)
# use a diff alias
# eval $(thefuck --alias FUCK)

#eval "$(dircolors ~/gruvbox.dircolors)"
#source "$HOME/.gruvbox_256palette.sh"
