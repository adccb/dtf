autoload -U add-zsh-hook

auto-vnv () {
  if [ -d .venv ]; then
    source .venv/bin/activate
	fi
}

auto-ls () {
  if [[ $#BUFFER -eq 0 ]]; then
    zle && echo ""
    ls
    echo ""

    zle && zle redisplay
  else
    zle .$WIDGET
  fi
}

zle -N auto-ls
zle -N accept-line auto-ls
add-zsh-hook chpwd auto-ls

zle -N auto-vnv
add-zsh-hook chpwd auto-vnv
