DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

mkdir -p "$DESTINATION/.config/nvim"
mkdir -p "$DESTINATION/.config/nvim/autoload"

DESTINATION="$(realpath ~/.config/nvim)"

info "Setting up NeoVim..."

find . -name "*.vim" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

find autoload -name "*.vim" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/autoload/$fn" "$DESTINATION/autoload/$fn"
done

success "Finished setting up Vim."
