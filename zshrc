# guess i need a PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# zsh specifics
export ZSH=$HOME/.oh-my-zsh
export ZSH_DIR=$HOME/.zsh
export plugins=(wd)
export ZSH_THEME='avit'
source $ZSH/oh-my-zsh.sh

## ruby
source /usr/local/share/chruby/chruby.sh
chruby 2.5

## python
alias vnv='source ./.venv/bin/activate'
alias killenv='deactivate'

# niceties
alias mkdir='mkdir -p'
alias celar='clear'
alias c='clear'
alias fuck='find . -iname "*.sw*" | xargs rm'
alias remote-server='ssh root@172.104.20.58'

# vim setup & config
alias vim='nvim'

# git details
alias gs='git status'
alias ga='git add .'
alias gp='git push -u origin HEAD'

