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

# Automatically load pyenv
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Andriod

# Use genymotion ADB
PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/Tools

# Set postgres path
export PGDATA='/usr/local/var/postgres'

# Enabled zsh_history
SAVEHIST=100
HISTFILE=~/.zsh_history

export TERM=xterm-256color

export PATH
