prompt_char='►'

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

_exit () { echo "%B%F{yellow}$?%f%b"}
_cwd  () { echo "%B%F{green}$(pwd | awk -F/ '{print $(NF-1)"/"$(NF)}')%f%b" }
_node () { echo "%B%F{yellow}$(node -v)%f%b"}
_ruby () { echo "%B%F{red}$(ruby --version | awk -F "[ ]+" '{print $2}')%f%b"}

set_prompt () {
  PROMPT=$'\n'"┌ $(_cwd) | $(_branch) | $(_exit) "$'\n'"└ %B$prompt_char%b "
}

precmd () { set_prompt $? }

chpwd () {
  nvm_exists=$(upfind ".nvmrc")
  if [ ! -z "$nvm_exists" ]; then nvm use; fi
}
