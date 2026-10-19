# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ==========================================
# Bash History & Window Settings
# ==========================================
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# ==========================================
# Colors & Aliases
# ==========================================
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

alias ll='ls -alF --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ==========================================
# Modern CLI & Prompt Integrations
# ==========================================

# 1. Starship Prompt
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# 2. Zoxide (Smart directory jumper: 'z')
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

# 3. FZF (Fuzzy finder keybindings: Ctrl+R, Ctrl+T, Alt+C)
if command -v fzf &> /dev/null; then
    eval "$(fzf --bash)"
fi

# User local bin PATH
export PATH="$HOME/.local/bin:$PATH"
