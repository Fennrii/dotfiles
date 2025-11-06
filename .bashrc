[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && startx
# Set up color for tmux
# export TERM="xterm-256color"
#
if [ -n "$TMUX" ]; then
    export TERM="xterm-256color"
fi

# Enable color support for ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    # eval "$(dircolors -b ~/.dircolors)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

find_file() {
  local n="${1:?usage: find_file <count> [grep-pattern]}";
  local pat="${@:2}";

  for ((i = 1; i <= n; i++)); do
    ls -d $PWD$(printf '%*s' "$i" '' | sed 's/ /\/\*/g') || exit 1
  done | grep --color=always -E "$pat"; 
}

fugrep() {
  local pattern="${1:?Usage: find_in_func <pattern> [dir]}"
  local dir="${2:-.}"

  # helper to print a specific line prefixed with file:line
  print_line() {
    local file=$1 ln=$2 txt
    txt=$(sed -n "${ln}p" "$file")
    printf '%s:%s' "$file" "$ln"
    [[ -n $txt ]] && printf ' %s' "$txt"
    printf '\n'
  }

  grep -R -n -- "$pattern" "$dir" | while IFS=: read -r file line _; do
    # --- Enclosing class (if any) ---
    local class_defs last_class class_line
    class_defs=$(grep -n -E '^[[:space:]]*class[[:space:]]+[A-Za-z_][A-Za-z0-9_]*' "$file" \
      | awk -F: -v L="$line" '$1 <= L')
    if [[ -n $class_defs ]]; then
      last_class=$(echo "$class_defs" | tail -n1)
      class_line=${last_class%%:*}
      print_line "$file" "$class_line"
    fi

    # --- Enclosing function (if any) ---
    local func_defs last_func func_line
    func_defs=$(grep -n -E '^[[:space:]]*(def|function)[[:space:]]+[A-Za-z_][A-Za-z0-9_]*' "$file" \
      | awk -F: -v L="$line" '$1 <= L')
    if [[ -n $func_defs ]]; then
      last_func=$(echo "$func_defs" | tail -n1)
      func_line=${last_func%%:*}
      print_line "$file" "$func_line"
      print_line "$file" $((func_line + 1))
    fi

    # # --- Print usage line with grep highlighting ---
    # grep --color=always -Hn -e "$pattern" "$file" \
    #   | grep "^$file:$line:" \
    #   | head -n1

    grep --color=always -n -e "$pattern" -- "$file" \
      | awk -F: -v F="$file" -v L="$line" 'BEGIN{OFS=":"} $1==F && $2==L{print; exit}'

    # --- Print the two lines after the match ---
    print_line "$file" "$line"
    print_line "$file" $((line + 1))
    print_line "$file" $((line + 2))

    printf '\n'
  done
}



# Set color for user and current directory
PS1='\[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h \[\e[35m\]\w\[\e[m\]\$ '

# Set alias for using vim
alias vim='nvim'
alias vi='nvim'
alias suvim='sudo -E -s nvim'
alias cdwm='cd $HOME/.config/suckless/dwm/'
alias ve='[ -d ./venv/ ]; source ./venv/bin/activate'
alias ms='source $HOME/.bashrc'
alias cdg='cd /mnt/encrypted/git'
alias ff='fastfetch'
# fastfetch

export PATH=$PATH:/opt/gradle/gradle-8.12.1/bin
export PATH=$PATH:$HOME/Documents/aseprite/aseprite-release/bin/
export PATH=$PATH:/opt/nvim-linux-x86_64/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin


export FZF_COMPLETION_TRIGGER='*'
export FZF_COMPLETION_OPTS='--border --info=inline'

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
BROWSER="bin/waterfox"
HISTFILE=~/.history
alias clang="clang -std=c99 -Wall -Werror"
