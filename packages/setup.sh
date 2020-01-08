#!/usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

COMMENT=\#*

sudo -v

info "Installing Brew packages"

substep_info "Updating brew"
if brew update && brew upgrade; then
  substep_success "Brew is up to date"
else
  substep_error "Unable to update brew, error occured"
fi

substep_info "Installing packages"

if brew bundle install; then
  substep_success "Packages is installed"
else
  substep_error "Unable to install brew dependencies, error occured"
fi

success "Finished installing Brew packages."
