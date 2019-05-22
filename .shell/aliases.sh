# Movement & File system
alias ..="cd .."
alias ls="e"
alias lsa="ea"
alias e="exa -lhm"
alias eg="exa -lhm --git"
alias ea="exa -lhma"
alias eag="exa -lhma --git"

# Dotfiles
alias dtf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Git
alias g="git"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias gco="git checkout"
alias gcob="git checkout -b"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset
%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias tmux="tmux -u"

# Rails
alias rs="rails server"

# Postgres
alias postgres="brew services start postgresql"

# Eyecandy
alias colorscheme="wal -i $HOME/Pictures/Wallpapers"
alias rwm="brew services restart chunkwm"
alias ewm="brew services stop chunkwm"
alias swm="brew services start chunkwm"

# Override default tools
alias cat="bat"

# Brainfart
alias rials="rails"

alias vim="nvim"
