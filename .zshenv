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
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


#-------------------- Settings -------------------------------------------------
# Set editor. Some apps use this including git
export EDITOR=nvim
export PAGER="most"


# -------------------- Prompt --------------------------------------------------
# Based on https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='[ %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f] '



#-------------------- Paths ----------------------------------------------------
export PATH=$PATH:/home/stewart/code/python/install/3.11.5/bin
export PATH=$PATH:/home/stewart/code/ruby/install/3.2.2/bin
export PATH=$PATH:/home/stewart/code/nvim/install/0.9.2/bin
export PATH=$PATH:/home/stewart/code/lua-language-server/bin
export PATH=$PATH:/home/stewart/code/php/install/8.2.10/bin
export PATH=$PATH:/home/stewart/code/php/bin
export PATH=$PATH:/home/stewart/code/mysql/install/8.1.0/bin
export PATH=$PATH:/home/stewart/code/zellij/bin
export MANPATH=$MANPATH:/home/stewart/code/php/install/8.2.10/php/man
export MANPATH=$MANPATH:/home/stewart/code/mysql/install/8.1.0/man
# Use NVM from https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



#-------------------- ZSH Extensions -------------------------------------------
# Auto suggestions from https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# FZF which has be installed via apt as provided key bindings for us
source /usr/share/doc/fzf/examples/key-bindings.zsh
# Source syntax highlighting https://github.com/zsh-users/zsh-syntax-highlighting/
source /home/stewart/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



#-------------------- Alias ----------------------------------------------------
alias cat="bat"
alias ls='ls --color'
alias ll='exa -l --icons'
alias la='exa --icons'
alias l='exa --icons'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'



#-------------------- Functions ------------------------------------------------
hr() {
  printf "-%.0s" {1..$1}
}

title() {
  echo -n "# "
  hr 20 
  echo -n " $1 "
  hr $(($(expr length $1) - 54))
  echo ""
}

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
    nvim
  popd
}
