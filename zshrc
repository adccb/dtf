source "$HOME/.dtf/zsh/theme.zsh"

alias vim='nvim'
alias gp='git push -u origin HEAD'
alias gs='git status'

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=nvim
export PATH="/Users/acrossan/.nvim/bin:/usr/local/bin/:$PATH:$HOME/.rvm/bin"

