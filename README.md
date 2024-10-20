# Dot Files

This repo is intended to function as a stand alone project with two primary
responsibilities. First to maintain term based configuration, functions and
files for apps. Second to provide an easy way to introduce all of this
to a new environment.

Why do this? As I learn more about shells, bash and other CLI tools the 
configuration effort gets higher and higher. This is an attempt to keep this 
whole configuration effort in one place while providing a reference for my own
learning

## Usage 
Run setup.

## Direct Deps
 * rust
 * git
 * fzf for history
 * zsh this is the default shell that is being used
 * entr for tmux auto reload - https://github.com/eradman/entr
 * nvim 
 * bat for cat
 * https://github.com/zsh-users/zsh-autosuggestions
 * https://github.com/zsh-users/zsh-syntax-highlighting/
 * nvm for managing node versions
 * rbenv
 * wl-copy for copy and paste when running wayland on linux

## Things you should have
 * A nerd font patched font.

## TODO  
 * Setup should do a git submodule init
 * Setup a health check function that will test for all requirements and fail
   if they are not met.
 * Figure out how to package up deps in my paths. We should remove that from
   this configuration
 * Start building up a non nvim configuration
 * Move fzf inline with a manual checkout
 * Attempt to rustup during install process.
 * Understand what should live in zshprofile and zshrc
 
## Credit Rwxrob
This project is inspired by rwxrob's dot files.  Check him out on twitch 
https://www.twitch.tv/rwxrob. The github repo for his dotfiles 
is here and well worth a look https://github.com/rwxrob/dot. 

