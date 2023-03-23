prompt_char='→'

upfind () {
  while [[ $PWD != $HOME ]] ; do
    CONFIG_FILE=$(find "$PWD" -maxdepth 1 -name "$1")

    if [[ ! -z "$CONFIG_FILE" ]]; then
      echo "$CONFIG_FILE"
      exit
    fi

    cd ..
  done
}

_branch () {
  if [[ $(git branch 2>&1) != *"fatal"* ]]; then 
    echo "%B%F{red}${$(git symbolic-ref HEAD)##refs/heads/}%f%b"
  else
    echo "%B%F{red}none%f%b"
  fi
}

_exit () { echo "$?" }
_cwd ()  { echo "%B%F{green}$(pwd | awk -F/ '{print $(NF-1)"/"$(NF)}')%f%b" }
_node () { echo "%B%F{yellow}$(node -v)%f%b"}

set_prompt () {
  PROMPT="$(_branch) | $(_cwd) %B$prompt_char%b "
  RPROMPT="📦 $(_node)"
}

precmd () { set_prompt $? }

chpwd () {
  nvm_exists=$(upfind ".nvmrc")
  if [ ! -z "$nvm_exists" ]; then nvm use; fi

  venv=$(upfind "venv")
  if [ ! -z "$venv" ]; then source "$venv/bin/activate"; fi
}
