#!/bin/bash

# --- Configure tools to follow XDG directories ---

follow_cargo() {
  export CARGO_HOME=$XDG_DATA_HOME/cargo
}

follow_docker() {
  export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
  export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker
}

follow_gem() {
  export GEM_HOME=$XDG_DATA_HOME/gem
  export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem
}

follow_gpg() {
  export GNUPGHOME=$XDG_DATA_HOME/gnupg
}

follow_less() {
  export LESSKEY=$XDG_CONFIG_HOME/less/lesskey
  export LESSHISTFILE=$XDG_CACHE_HOME/less/history
}

follow_zsh() {
  export ZDOTDIR=$XDG_CONFIG_HOME/zsh
  export HISTFILE=$XDG_CACHE_HOME/zsh/zhistory 
}

follow_antigen() {
  export ADOTDIR=$XDG_DATA_HOME/antigen
  export ANTIGEN_CACHE=$XDG_DATA_HOME/antigen/cache
}

follow_maven() {
  export M2_HOME=$XDG_CONFIG_HOME/maven
}

follow_pyenv() {
  export PYENV_ROOT=$XDG_DATA_HOME/pyenv
}

follow_jenv() {
  export JENV_ROOT=$XDG_DATA_HOME/jenv
}

follow_nvm() {
  export NVM_DIR=$XDG_CONFIG_HOME/nvm
}

follow_npm() {
  export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
}

follow_kubectl() {
  export KUBECONFIG=$XDG_CONFIG_HOME/kube/config
}

follow_vscode() {
  export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
}

# --- Configure PATH variable ---
configure_path() {
  export PATH=$PYENV_ROOT/bin:$PATH
  export PATH=$JENV_ROOT/shims:$PATH
  export PATH=/usr/local/sbin:$PATH
  export PATH=$PATH:/opt/local/bin
  export PATH=$PATH:/opt/homebrew/bin
  export PATH=$PATH:/opt/homebrew
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
}

# --- Configure tools ---
configure_pyenv() {
  if command -v jenv 1>/dev/null 2>&1; then 
    eval "$(pyenv init --path)"
  fi
}

configure_jenv() {
  if command -v jenv 1>/dev/null 2>&1; then
    eval "$(jenv init -)"
  fi
}

configure_nvm() {
  [ -s "$(brew --prefix nvm)" ] && \. "$(brew --prefix nvm)/nvm.sh"
}

configure_zsh() {
  export HISTIGNORE=" *:ls:cd:cd -:pwd:exit:date:* --help:* -h";
  export SPACESHIP_CHAR_SYMBOL="->"
  export SPACESHIP_CHAR_SUFFIX=" "
}
  
configure_tmux() {
  # --- Correct tmux colors ---
  export TERM=xterm-256color

}

configure_gpg() {
  export GPG_TTY=$(tty)
}

configure_ssh() {
  # --- Use 'vi' as default editor on SSH connection ---
  if [[ -n $SSH_CONNECTION ]]; then
     export EDITOR='vi'
  fi
}

# --- Configure defaults ---

set_default_editor() {
  export EDITOR=/usr/local/bin/nvim;
}

set_default_lang() {
  # --- Prefer US English and use UTF-8 ---
  export LANG="en_US.UTF-8";
  export LC_ALL="en_US.UTF-8";
}

# --- Run configuration
{
  follow_cargo
  follow_docker
  follow_gem
  follow_gpg
  follow_less
  follow_zsh
  follow_antigen
  follow_maven
  follow_pyenv
  follow_jenv
  follow_nvm
  follow_npm
  follow_kubectl
  follow_vscode

  configure_path

  configure_jenv
  configure_nvm
  configure_zsh
  configure_tmux
  configure_gpg
  configure_ssh

  set_default_editor
  set_default_lang
}
