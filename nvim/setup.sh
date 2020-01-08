DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up NeoVim"

substep_info "Creating config directories for NeoVim"
if mkdir -p "$DESTINATION/.config/nvim" && mkdir -p "$DESTINATION/.config/nvim/autoload"; then
  substep_success "Config directories created"
else
  substep_error "Unable to create config directories for NeoVim, error occured"
fi

DESTINATION="$(realpath ~/.config/nvim)"

substep_info "Linking NeoVim configuration files"
find . -name "*.vim" -maxdepth 1 | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

find autoload -name "*.vim" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/autoload/$fn" "$DESTINATION/autoload/$fn"
done

success "Finished setting up NeoVim."
