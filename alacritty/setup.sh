DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Configuring Alacritty term"

substep_info "Creating config directory for alacritty"
mkdir -p "$DESTINATION/.config/alacritty"
DESTINATION="$(realpath $DESTINATION/.config/alacritty)"
substep_success "Alacritty directory is created"

substep_info "Linking configuration file"
symlink "$SOURCE/alacritty.yml" "$DESTINATION/alacritty.yml"
success "Finished setting up Alacritty."
