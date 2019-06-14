export PATH="$PATH:$HOME/.rvm:/bin:/usr/local/bin:/usr/local/sbin"

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias mkdir='mkdir -p'
alias celar='clear'

alias vim='nvim'
alias vi='vim -u /dev/null'

alias gs='git status'
alias ga='git add .'
alias gp='git push'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionsssww

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/\* //'
}

export PS1="
\e[1;32m\W\e[0;37m (\e[1;31m\$(git_branch)\e[0;37m) \e[1;33myou are more gold than clay.\e[1;0;37m
\e[1;34mλ \e[0;37m"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
