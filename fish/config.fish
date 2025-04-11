# Aliases for common commands
alias nv="nvim"
alias vim="nvim"

function nvm_auto_use
  if test -f .nvmrc
    nvm use (cat .nvmrc)
  end
end

function cdnvm --wraps=cd --description 'cd into a directory and automatically use node version from .nvmrc'
  builtin cd $argv
  nvm_auto_use
end

alias cd='cdnvm'

# tmux aliases
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
status --is-interactive; and rbenv init - fish | source

# Mysql2 gem environment variables
set -Ux LDFLAGS "-L/opt/homebrew/opt/mysql@8.0/lib"
set -Ux CPPFLAGS "-I/opt/homebrew/opt/mysql@8.0/include"
set -Ux PKG_CONFIG_PATH "/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
set -Ux PATH "/opt/homebrew/opt/mysql@8.0/bin" $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nick/Applications/google-cloud-sdk/path.fish.inc' ]; . '/Users/nick/Applications/google-cloud-sdk/path.fish.inc'; end
