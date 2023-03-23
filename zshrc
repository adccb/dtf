export NVM_DIR="$HOME/.nvm"
export EDITOR=nvim

# guess i need a PATH
export PATH="/Users/acrossan/.nvim/bin:$PATH"
export PATH="/usr/local/opt:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"

# zsh specifics
source "$HOME/.dtf/zsh/theme.zsh"
export ZSH_DIR=$HOME/.zsh
export ZSH_THEME='avit'

# javascript
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# niceties
alias mkdir='mkdir -p'
alias celar='clear'
alias c='clear'
alias fuck='find . -iname "*.sw*" | xargs rm'
alias "$"="$@"

# vim setup & config
alias vim='nvim'

# git details
alias gs='git status'
alias g='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push -u origin HEAD'
alias gd='git diff'
alias uncommit='git reset --soft HEAD~1'
