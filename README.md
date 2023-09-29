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
Run setup and pray.

## Tools 
 * zsh
 * entr for tmux auto reload - https://github.com/eradman/entr
 * nvim 
 * bat for cat
 * https://github.com/zsh-users/zsh-autosuggestions
 * https://github.com/zsh-users/zsh-syntax-highlighting/
 * nvm for managing node versions
 * rbenv for managing ruby versions although we will have to migrate to this

## TODO 
 * Add rbenv
 * Setup a health check function that will test for all requirements and fail
   if they are not met.
 * Figure out how to package up deps in my paths. We should remove that from
   this configuration
 * Start building up a vim configuration
  
## Credit Rwxrob
This project somewhat based on rwxrob's dot files.  Check him 
out on twitch https://www.twitch.tv/rwxrob. The github repo for his dotfiles 
is here and well worth a look https://github.com/rwxrob/dot. 


