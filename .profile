# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias reboot="sudo reboot"

# rust
#
# meus scripts
export PATH="$HOME/.local/bin/scripts:$PATH"

# racket
#export PATH="/usr/local/racket/bin:$PATH"

# go
#export GOPATH="$HOME/go"
#export PATH="$GOPATH/bin/:$PATH"

# mpd

export MPD_HOST="$HOME/.config/mpd/socket"

# nvm

export NVM_DIR="$HOME/.nvm"

# deno

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Dotnet

export DOTNET_ROOT=/opt/dotnet

# Cursor

export XCURSOR_PATH=${XCURSOR_PATH}:~/.icons

# READER

export READER="zathura"

# nvm

#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.cargo/env"
