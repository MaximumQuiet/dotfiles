#!/usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/alacritty)"

info "Setting up Alacritty term..."

find . -name "alacritty*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up Alacritty."
