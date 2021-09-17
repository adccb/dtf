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
  fi
}

_exit ()   { echo "$?" }
_cwd ()    { echo "%B%F{green}$(pwd | awk -F/ '{print $(NF-1)"/"$(NF)}')%f%b" }
_node ()   { echo "%B%F{yellow}$(node -v)%f%b"}
_python () { 
  if [[ -z $VIRTUAL_ENV ]]; then
    echo "%B%F{blue}venvain't%f%b"
  else
    echo "%B%F{blue}venv'd%f%b"
  fi
}

set_prompt () {
  # setting to a variable so zsh will actually interpolate those \n
  str="$(_cwd) %B$prompt_char%b "

  PROMPT=$(echo "$str")
  RPROMPT="$(_branch) :: $(_python) :: $(_node)"
}

precmd () { 
  # set iterm tab title
  echo -ne "\e]1;‍\a"

  set_prompt $?
}

chpwd () {
  nvm_exists=$(upfind ".nvmrc")
  if [ ! -z "$nvm_exists" ]; then nvm use; fi

  venv=$(upfind "venv")
  if [ ! -z "$venv" ]; then source "$venv/bin/activate"; fi
}
