if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/dotfiles/.config/fish/alias.fish

# pnpm
set -gx PNPM_HOME "/Users/cj/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
