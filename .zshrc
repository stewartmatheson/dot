#-------------------- ZSH Extensions -------------------------------------------
# Auto suggestions from https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF which has be installed via apt as provided key bindings for us
ubuntu_file="/usr/share/doc/fzf/examples/key-bindings.zsh"
if [ -e "$ubuntu_file" ]; then
    source $ubuntu_file
fi

arch_file="/usr/share/fzf/key-bindings.zsh"
if [ -e "$arch_file" ]; then
    source $arch_file
fi

arch_completion_file="/usr/share/fzf/completion.zsh"
if [ -e "$arch_completion_file" ]; then
    source $arch_completion_file
fi

# Source syntax highlighting https://github.com/zsh-users/zsh-syntax-highlighting/
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#-------------------- Paths ----------------------------------------------------
# TODO : We should not manage paths here. We need to use native package managers
# Use NVM from https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Introduce RBENV
eval "$(~/.rbenv/bin/rbenv init - zsh)"

# Added by the rust up install
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

#Source the paths file
source "$HOME/.paths"

# colorscript

if [ -x "$(command -v macchina)" ]; then
  macchina
fi
