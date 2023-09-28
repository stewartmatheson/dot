
# The following lines were added by compinstall
zstyle :compinstall filename '/home/stewart/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


# Add custom installed python to our path we should figure out how to move this in to .profile
export PATH=$PATH:/home/stewart/code/python/install/3.11.5/bin
export PATH=$PATH:/home/stewart/code/ruby/install/3.2.2/bin
export PATH=$PATH:/home/stewart/code/nvim/install/0.9.2/bin
export PATH=$PATH:/home/stewart/code/lua-language-server/bin
export PATH=$PATH:/home/stewart/code/php/install/8.2.10/bin
export PATH=$PATH:/home/stewart/code/php/bin
export PATH=$PATH:/home/stewart/code/mysql/install/8.1.0/bin
export PATH=$PATH:/home/stewart/code/zellij/bin

# PHP provides man pages lets add them here
export MANPATH=$MANPATH:/home/stewart/code/php/install/8.2.10/php/man
export MANPATH=$MANPATH:/home/stewart/code/mysql/install/8.1.0/man

# Set editor. Some apps use this including git
export EDITOR=nvim

# Auto suggestions from https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# A handy function to edit this file from anywhere
zc () {
  pushd "$HOME"
    $EDITOR .zshrc
    source .zshrc
  popd
}

# A handy function for editing the nvim configuration
nc () {
  pushd "$HOME/.config/nvim"
    nvim
  popd
}

# Setup some alias
alias cat="bat"

# FZF which has be installed via apt as provided key bindings for us
source /usr/share/doc/fzf/examples/key-bindings.zsh

# Use NVM from https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# A function that will kill a process based on a port number
kp() {
  local port_number=$1
  lsof -i tcp:${port_number} | awk 'NR!=1 {print $2}' | xargs kill 
}

# Source syntax highlighting https://github.com/zsh-users/zsh-syntax-highlighting/
source /home/stewart/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt to something to sane
PROMPT="[ %~ ] "

# some more ls aliases
alias ls='ls --color'
alias ll='exa -l --icons'
alias la='exa --icons'
alias l='exa --icons'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

