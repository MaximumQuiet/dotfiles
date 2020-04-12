export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color
alias pebble=$HOME/SDK/pebble-sdk-4.5-rc1-mac/bin/pebble

VISUAL=nvim;
export VISUAL 
EDITOR=nvim;
export EDITOR;

source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://g
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Manage plugins and themes with antigen
source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
#antigen bundle encode64
#antigen bundle colorize
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme reobin/typewritten
antigen apply

# User configuration

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi'
 else
   export EDITOR='nvim'
 fi
