DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

mkdir -p "$DESTINATION/.config/alacritty"
DESTINATION="$(realpath $DESTINATION/.config/alacritty)"

info "Setting up Alacritty term..."

symlink "$SOURCE/alacritty.yml" "$DESTINATION/alacritty.yml"

success "Finished setting up Alacritty."
