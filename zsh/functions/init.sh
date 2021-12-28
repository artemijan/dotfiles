#!/usr/bin/env zsh
BASEDIR=$(dirname "$0")
force-redraw-prompt() {
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done
  zle reset-prompt
}
for file in $BASEDIR/*.sh; do
	if [[ $file == *init.sh ]]
	then
    else
    	source $file
    fi
done
