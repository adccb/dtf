# guess i need a PATH
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# zsh specifics
export ZSH=$HOME/.oh-my-zsh
export ZSH_DIR=$HOME/.zsh
export plugins=(wd)
export ZSH_THEME='avit'
source $ZSH/oh-my-zsh.sh

# set up language environments

## ruby
source /usr/local/share/chruby/chruby.sh
chruby 2.5

## node 
n lts
n lts

## python
alias vnv='source ./.venv/bin/activate'
alias killenv='deactivate'

# niceties
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias mkdir='mkdir -p'
alias celar='clear'
alias fuck='find . -iname "*.sw*" | xargs rm'

# vim setup & config
alias vi='vim -u /dev/null'
alias vim='nvim'

# git details
alias gs='git status'
alias ga='git add .'
alias gp='git push'

# taskman config
TASKMAN_INSTALL_DIRECTORY=$HOME/.taskman

