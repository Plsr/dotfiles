# Load colors in order to use them
autoload -U colors && colors

# Set hostname to λ
local host_name="%{$fg[cyan]%}λ"

# Shorten $HOME path to '~'
local path_string="%{$fg[yellow]%}%~"

local prompt_string=">"

# Expoort finished prompt
PROMPT="${host_name} ${path_string} ${prompt_string} "
