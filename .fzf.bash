# Setup fzf
# ---------
if [[ ! "$PATH" == */home/andrew/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/andrew/.fzf/bin"
fi

eval "$(fzf --bash)"
