# Load exports 
[[ -f $XDG_CONFIG_HOME/zsh/exports.sh ]] && source $XDG_CONFIG_HOME/zsh/exports.sh 

# Load aliases
[[ -f $XDG_CONFIG_HOME/zsh/aliases.sh ]] && source $XDG_CONFIG_HOME/zsh/aliases.sh

# Load functions
for func in $(ls $XDG_CONFIG_HOME/zsh/functions.sh); do
    source "$func"
done

# Load functions
for func in $(ls $XDG_CONFIG_HOME/zsh/private-functions.sh); do
    source "$func"
done

# Manage plugins and themes with antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen theme tylerreckart/hyperzsh

antigen apply 

# Initialize jenv
#if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Initialize pyenv
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
