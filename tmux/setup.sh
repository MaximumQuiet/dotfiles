DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up tmux"

find . -name ".tmux*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up tmux."
