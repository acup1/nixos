# setfont cyr-sun16

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c="clear"
alias n="nvim"
alias py="python3"
alias pm="sudo pacman --noconfirm"
alias yy="yay --noconfirm"
alias cmatrix="cmatrix -C white"
alias neofetch="c && neofetch && read"
alias hde="hyprctl dispatch exec"
alias nv="nvim"
alias du="du -sh"
alias ns="nix-shell"

#binds
bindkey -s "^L" 'ls -la^M'
bindkey -s "^U" 'c^M'
bindkey -s "^Y" 'yazi^M'
bindkey -s "^B" 'btop^M'
bindkey -s "^E" 'nv ^M'
bindkey -s "^Z" 'fg^M'
bindkey -s "^N" 'neofetch^M'
bindkey -s "^D" 'df -h^M'
bindkey -s "^T" 'du .^M'

export NIXPKGS_ALLOW_UNFREE=1
export EDITOR=nvim
export SHELL=zsh

eval "$(starship init zsh)"
