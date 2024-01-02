prompt_char='➡️ '

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


# structure
_char () { echo "%F{white}$prompt_char%f " }
_top  () { echo "%F{white}╭%f"}
_mid  () { echo "%F{white}├%f"}
_bot  () { echo "%F{white}╰%f"}

# complications
_cwd  () { echo "📚 %B%F{blue}$(pwd | awk -F/ '{print $(NF-1)"/"$(NF)}')%f%b" }
_node () { echo "📦 %B%F{yellow}$(node -v)%f%b" }
_git  () {
  STR="🌳 %B%F{cyan}${$(git symbolic-ref HEAD)##refs/heads/}%f%b"
  read files adds dels <<< ${$(git diff --stat | tail -n1)//[^0-9]/ }

  if (( adds > 0 )); then STR+=" %F{green}+$adds" fi
  if (( dels > 0 )); then STR+=" %F{red}-$dels" fi

  echo $STR
}

set_prompt () {
  STR=$'\n'"$(_top) $(_cwd)"$'\n'

  STR+="$(_mid) $(_node)"$'\n'
  if [ -d ".git" ]; then STR+="$(_mid) $(_git)"$'\n' fi

  STR+="$(_bot) $(_char)"
  PROMPT=$STR
}

precmd () { set_prompt $? }
chpwd () {
  nvm_exists=$(upfind ".nvmrc")
  if [ ! -z "$nvm_exists" ]; then nvm use; fi
}
