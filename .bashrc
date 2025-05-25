# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
export SSH_AUTH_SOCK

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias ll='ls -lah --color=auto'   # Λεπτομερής λίστα αρχείων με μέγεθος σε ανθρώπινη αναγνώσιμη μορφή
alias la='ls -A --color=auto'     # Λίστα αρχείων χωρίς τα "." και ".."
alias l='ls -CF --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias upd='sudo pacman -Syu -y && paru -Syu -y'
alias vi='kitty -e nvim "$@"'
alias code='ELECTRON_OZONE_PLATFORM_HINT=wayland zeditor "$@"'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'

export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=kitty

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=~/.npm-global/bin:$PATH
export PATH="/usr/bin/php:$PATH"
export GOPATH="$HOME/.config/go"
export PATH="$PATH:$GOPATH/bin"

eval "$(starship init bash)"
