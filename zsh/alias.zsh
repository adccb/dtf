autoload -U add-zsh-hook

alias e='/usr/local/Cellar/emacs/25.2/bin/emacs'
alias fucking='sudo'
alias fuck='sudo !!'
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias mkdir='mkdir -p'
alias c='clear'
alias celar='clear'

alias vnv='source ./.venv/bin/activate'
alias g='git status'
alias gp='git push'

auto-ls () {
  if [[ $#BUFFER -eq 0 ]]; then
    zle && echo ""
    ls -a
    echo ""

    zle && zle redisplay
  else
    zle .$WIDGET
  fi
}

zle -N auto-ls
zle -N accept-line auto-ls
add-zsh-hook chpwd auto-ls
