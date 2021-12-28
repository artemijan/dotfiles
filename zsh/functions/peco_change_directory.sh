#!/usr/bin/env zsh
function _peco_change_directory()
{
  argv=$@
  if [ -z ${argv} ]
  then
    foo=$(peco | perl -pe 's/([ ()])/\\\\$1/g'| cut -d ' ' -f2- | awk -v PWD="$PWD" '{print PWD"/"$1}' | tr ' ' '\ ')
  else
    foo=$(echo "${argv}" | peco | perl -pe 's/([ ()])/\\\\$1/g'| cut -d ' ' -f2- | awk -v PWD="$PWD" '{print PWD"/"$1}' | tr ' ' '\ ')
  fi
  if [ $foo ]
  then
    if test -d $foo
    then 
      builtin cd $foo
      force-redraw-prompt
      $funcstack[2]
    elif test -e $foo
    then
      micro $foo
    fi
  else
    force-redraw-prompt
  fi
}

function peco_change_directory_list_all()
{
  OUTPUT=$(exa --no-permissions --no-user --group-directories-first --no-time --icons -l --no-filesize --all --all)
  _peco_change_directory ${OUTPUT}	
}
function peco_change_directory()
{
  OUTPUT=$(exa --no-permissions --no-user --group-directories-first --no-time --icons -l --no-filesize --all --all | grep -P '^.{1}\s(\.\.|[^\.])')
  _peco_change_directory ${OUTPUT}
}
