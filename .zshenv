#  _________  _   _    ____             __ _       
# |__  / ___|| | | |  / ___|___  _ __  / _(_) __ _ 
#   / /\___ \| |_| | | |   / _ \| '_ \| |_| |/ _` |
#  / /_ ___) |  _  | | |__| (_) | | | |  _| | (_| |
# /____|____/|_| |_|  \____\___/|_| |_|_| |_|\__, |
#                                            |___/ 
#
#
#-------------------- ZSH Default ----------------------------------------------
# The following lines were added by compinstall
zstyle :compinstall filename '/home/stewart/.zshrc' # TODO : Fix this
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


# -------------------- Compleation ---------------------------------------------
autoload -U +X bashcompinit && bashcompinit
fpath=(~/.zsh/zsh-completions $fpath)
fpath=(~/code/open-source/github-cli/completion $fpath)
autoload -Uz compinit
compinit -i


#-------------------- Settings -------------------------------------------------
# Set editor. Some apps use this including git
export EDITOR=nvim
export PAGER="most"
export ZET_HOME="${HOME}/.zet"
export MANPAGER="nvim +Man!"
export GOPATH="${HOME}/code/go"

# The following is for wayland. We should puts this in a switch
export QT_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland 


# -------------------- Prompt --------------------------------------------------
# Based on https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='[ %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f] '

# Add a docker label to the prompt if we are running in docker
if [ -e /.dockerenv ]; then
  PROMPT='[ docker %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f] '
fi

# -------------------- Alias Functions -----------------------------------------
# A function that will kill a process based on a port number
kp() {
  local port_number=$1
  lsof -i tcp:${port_number} | awk 'NR!=1 {print $2}' | xargs kill 
}

# A handy function to edit this file from anywhere
zc () {
  pushd "$HOME"
    $EDITOR .zshenv
  popd
  exec zsh
}

# A handy function for editing the nvim configuration
nc () {
  pushd "$HOME/.config/nvim"
    nvim init.lua
  popd
}



#-------------------- Alias ----------------------------------------------------
alias cat="bat"
alias ls='ls --color'
alias ll='exa -l --icons'
alias la='exa --icons'
alias l='exa --icons'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias r='rbenv exec'
alias rb='rbenv exec bundle exec'
alias lynx='lynx -accept_all_cookies -vikeys'
alias '?'='BROWSER=lynx ddgr'
alias chmx="chmod +x "
alias fp="ps auxh | grep "


# -------------------- Output Functions ----------------------------------------
# A set of fucntions that output things. Handy for snippets et al.
title() {
  echo -n "# "
  hr 20 
  echo -n " $1 "
  hr $(($(expr length $1) - 54))
  echo ""
}

# Output a line made up of - with the amount
hr() {
  printf "-%.0s" {1..$1}
}

# Function to add a prefix to each line of piped input
add_prefix() {
    local prefix="$1"
    while IFS= read -r line; do
        echo "${prefix}${line}"
    done
}

figlet_comment() {
  figlet $1 | add_prefix "# "
}

printp() {
  for i in $(echo "$PATH" | sed 's/:/ /g'); do echo $i;  done;
}

git_clone_clipboard() {
  git clone $(wl-paste)
}

pacman_list_files () {
  pacman -Qlq $1 | grep -v '/$' | xargs -r du -h | sort -h
}

split_and_print() {
    parts=("${(@s/:/)1}")
    for part in "${parts[@]}"; do
        echo "$part"
    done
}

show_paths() {
  split_and_print "$PATH"
}

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

