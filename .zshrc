###########
# ALIASES #
###########

# Alias for dotfiles repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Source private aliases
if [ -f ~/.p_aliases ]; then
    source ~/.p_aliases
fi

source "${HOME}/.shell/aliases.sh"

###########
# Visulas #
###########
source "${HOME}/.shell/prompt.sh"

########
# PATH #
########

# Make sure the right python version is used
PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Add rbenv to PATH
PATH="$HOME/.rbenv/bin:$PATH"

# Autmoatically load rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Andriod

# Use genymotion ADB
PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/Tools

export PATH
