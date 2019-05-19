#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../bin/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up zsh shell..."

info "Downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

find . -name ".zsh*" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

clear_broken_symlinks "$DESTINATION"

set_zsh_shell() {
    if grep --quiet zsh <<< "$SHELL"; then
        success "zsh shell is already set up."
    else
        substep_info "Adding fish executable to /etc/shells"
        if grep --fixed-strings --line-regexp --quiet "/usr/local/bin/zsh" /etc/shells; then
            substep_success "zsh executable already exists in /etc/shells."
        else
            if sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"; then
                substep_success "zsh executable added to /etc/shells."
            else
                substep_error "Failed adding zsh executable to /etc/shells."
                return 1
            fi
        fi
        substep_info "Changing shell to zsh"
        if sudo chsh -s /usr/local/bin/zsh; then
            substep_success "Changed shell to zsh"
        else
            substep_error "Failed changing shell to zsh"
            return 2
        fi 
    fi
}

if set_zsh_shell; then
    success "Successfully set up zsh shell."
else
    error "Failed setting up zsh shell."
fi
