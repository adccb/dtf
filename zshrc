export ZSH=$HOME/.oh-my-zsh
export ZSH_DIR=$HOME/.zsh
export plugins=(wd)
export ZSH_THEME='spaceship'

export NVM_DIR=$(realpath $HOME/.nvm)
source $ZSH/oh-my-zsh.sh

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias mkdir='mkdir -p'
alias celar='clear'

alias fuck='find . -iname "*.sw*" | xargs rm'
alias vi='vim -u /dev/null'
alias vim='nvim'

alias vnv='source ./.venv/bin/activate'
alias killenv='deactivate' # kill the active virtualenv

alias gs='git status'
alias ga='git add .'
alias gp='git push'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

