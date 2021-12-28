#!/usr/bin/env zsh
function peco_select_history()
{
  argv=$@
  if [ -z ${argv} ]
  then
    set peco_flags --layout=bottom-up --query "$argv"
  else
    set peco_flags --layout=bottom-up
  fi

  foo=$(history|tail -r |peco $peco_flags|cut -c 8-)
  if [ -z ${foo} ]
  then
    
  else
    eval "${foo}"
    force-redraw-prompt
  fi
}
