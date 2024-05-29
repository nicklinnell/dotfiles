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

if status is-interactive
    # Commands to run in interactive sessions can go here
end
status --is-interactive; and rbenv init - fish | source
