# Movement & File system
alias ..="cd .."
alias ls="e"
alias lsa="ea"
alias e="exa -lhm"
alias eg="exa -lhm --git"
alias ea="exa -lhma"
alias eag="exa -lhma --git"

# tmux
alias ta="tmux attach -t"

# Dotfiles
alias dtf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Git
alias g="git"
alias gst="git status -s"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias gco="git checkout"
alias gcob="git checkout -b"
alias uncomm="git reset HEAD^"

function gsc
  git lg | fzf --ansi | awk '{print $2}' | xargs git show 
end

function gbc
  git lg | fzf --ansi | awk '{print $2}' | xargs git show --pretty="" --name-only | cat | xargs nvim -p
end

alias tmux="tmux -u"

# Rails
alias rs="rails server"

# Docker
alias dcud="docker-compose up -d"

# Eyecandy
alias colorscheme="wal -i $HOME/Pictures/Wallpapers"
alias rwm="brew services restart yabai"
alias ewm="brew services stop yabai"
alias swm="brew services start yabai"

# Override default tools
alias cat="bat"

# Brainfart
alias rials="rails"

# Use Neovim
alias vim="nvim"

alias edit="open -a MacVim.app $1"

alias did="vim +'normal Go' +'r!date' ~/docs/did.txt"
alias leftoff="vim ~/docs/leftoff.md"

alias vimconf="cd ~/.config/nvim && vim ."
alias fishconf="cd ~/.config/fish && vim config.fish"
alias showalias="cat ~/.config/fish/conf.d/aliases.fish"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias gj="git-jump"
alias lg="lazygit"

alias sfconf="source ~/.config/fish/config.fish"
