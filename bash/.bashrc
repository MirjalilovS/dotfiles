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
# Eza (Better ls) Aliases
# ==========================
# --icons=always : Shows file/folder icons (Requires a Nerd Font)
# --group-directories-first : Puts folders at the top, files at the bottom
# --git : Shows git status (modified, added, etc) next to files

alias ls="eza --icons=always --group-directories-first"
alias ll="eza -lh --icons=always --group-directories-first --git"
alias la="eza -lah --icons=always --group-directories-first --git"
alias lt="eza --tree --level=2 --icons=always --group-directories-first"
