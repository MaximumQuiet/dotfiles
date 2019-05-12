DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"

mkdir -p "$(realpath ~/.config/nvim)"

DESTINATION="$(realpath ~/.config/nvim)"

info "Setting up NeoVim..."

find . -name "init*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up Vim."
