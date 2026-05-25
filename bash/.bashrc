# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
eval "$(mise activate bash)"
export PATH="$HOME/go/bin:$PATH"

# ==========================
# Custom Everforest Git Prompt
# ==========================

# Extract the current Git branch name
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Everforest Medium RGB Colors
EF_GREEN="\[\e[38;2;167;192;128m\]"  # #a7c080
EF_BLUE="\[\e[38;2;127;187;179m\]"   # #7fbbb3
EF_YELLOW="\[\e[38;2;219;188;127m\]" # #dbbc7f
EF_RESET="\[\e[0m\]"                 # Resets to Alacritty's default foreground (#d3c6aa)

# Build the prompt using the variables
export PS1="${EF_GREEN}\u@\h${EF_RESET}:${EF_GREEN}\w${EF_RESET}${EF_BLUE}\$(parse_git_branch)${EF_RESET}\$ "

# ==========================
# Eza (Better ls) Aliases
# ==========================
# --icons=always : Shows file/folder icons (Requires a Nerd Font)
# --group-directories-first : Puts folders at the top, files at the bottom
# --git : Shows git status (modified, added, etc) next to files

alias ls="eza --icons=always --group-directories-first"
alias ll="eza -lh --icons=always --group-directories-first --git"
alias la="eza -lah --icons=always --group-directories-first --git"
alias lt="eza --tree --level=2 --icons=always --group-directories-first"
