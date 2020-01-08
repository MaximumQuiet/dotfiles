#!/usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up zsh"

substep_info "Downloading oh-my-zsh"
if sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; then
  substep_success "oh-my-zsh successfully downloaded"
else
  substep_error "Unable to download oh-my-zsh, error occured"
fi

substep_info "Downloading antigen"
if sh -c "$(curl -L git.io/antigen --create-dirs -o $DESTINATION/.antigen/antigen.zsh)"; then
  substep_success "antigen successfully downloaded"
else
  substep_error "Unable to download antigen, error occured"
fi

substep_info "Linking zsh configuration files"
find . -name ".zsh*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

substep_info "Clearing broken symlinks"
clear_broken_symlinks "$DESTINATION"
