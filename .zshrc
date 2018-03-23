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
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Add rbenv to PATH
export PATH="$HOME/.rbenv/bin:$PATH"

# Autmoatically load rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Andriod
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
