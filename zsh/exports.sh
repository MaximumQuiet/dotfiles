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

# --- Configure PATH variable ---
configure_path() {
  export PATH=$PYENV_ROOT/bin:$PATH
  export PATH=$JENV_ROOT/shims:$PATH
  export PATH=/usr/local/sbin:$PATH
}

# --- Configure tools ---

configure_pyenv() {
  if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
  fi
}

configure_jenv() {
  if command -v jenv 1>/dev/null 2>&1; then
    eval "$(jenv init -)"
  fi
}

configure_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

configure_zsh() {
  export HISTIGNORE=" *:ls:cd:cd -:pwd:exit:date:* --help:* -h";
  export TYPEWRITTEN_SYMBOL="->"
  export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "
  export TYPEWRITTEN_COLOR_MAPPINGS="primary:#ff8f40;secondary:#ff8f40;accent:#e6b450;info_negative:#ff3333;info_positive:#c2d94c;info_neutral_1:#e6b450;info_neutral_2:#59c2ff;info_special:#95e6cb" 
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

configure_docker() {
  export DOCKER_HOST='tcp://192.168.42.2:2376'
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

  configure_path

  configure_pyenv
  configure_jenv
  configure_nvm
  configure_zsh
  configure_tmux
  configure_gpg
  configure_ssh
  configure_docker

  set_default_editor
  set_default_lang
}
