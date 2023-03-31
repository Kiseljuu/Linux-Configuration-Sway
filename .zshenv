# Color
export TERM='rxvt-256color'

# Editors
export EDITOR="nvim"
export VISUAL="nvim"

# History
export HISTSIZE=10000                   
export SAVEHIST=10000             
export HISTFILE="$ZDOTDIR/.zhistory"    

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# Custom Directories
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo/bin"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Paths
export PATH="/usr/bin":"/usr/bin/vendor_perl":"/usr/bin/core_perl":"$HOME/.config/local/share/cargo/bin":"$HOME/.config/local/share/gem/ruby/3.0.0/bin"
