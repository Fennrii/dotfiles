[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && startx
# Set up color for tmux
# export TERM="xterm-256color"
#
if [ -n "$TMUX" ]; then
    export TERM="xterm-256color"
fi

# Enable color support for ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# Set color for user and current directory
PS1='\[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h \[\e[35m\]\w\[\e[m\]\$ '

# Set alias for using vim
alias vim='nvim'
alias vi='nvim'
alias suvim='sudo -E -s nvim'
alias cdwm='cd $HOME/.config/suckless/dwm/'
alias ve='[ -d ./venv/ ]; source ./venv/bin/activate'
alias ms='source $HOME/.bashrc'
alias ff='fastfetch'
# fastfetch

export PATH=$PATH:/opt/gradle/gradle-8.12.1/bin:$HOME/Documents/aseprite/aseprite-release/bin/


export FZF_COMPLETION_TRIGGER='*'
export FZF_COMPLETION_OPTS='--border --info=inline'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. "$HOME/.cargo/env"
