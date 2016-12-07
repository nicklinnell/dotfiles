export EDITOR="/usr/bin/vim"
export PATH="~/.bin:/usr/local/bin:$PATH"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
source ~/.bin/tmuxinator.bash

#alias dev="ssh dev"
alias compose="docker-compose"
alias dm="docker-machine"
alias tmux="tmux -2"
alias dangling="docker images -q -f dangling=true"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
