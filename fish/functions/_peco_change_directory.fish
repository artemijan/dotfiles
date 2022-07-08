function _peco_change_directory
  if [ (count $argv) ]
    peco --query "$argv " | exa_path | read foo
  else
    peco |exa_path | read foo
  end
 
  if [ "$foo" ]
    if test -d "$foo"
      builtin cd "$foo"
      commandline -r ''
      commandline -f repaint
      peco_change_directory
    else if test -e "$foo"
      if test -n "$TERMINAL_VSCODE"
        code -r "$foo"
     else
        micro "$foo"
     end
    end
  else
    commandline -r ''
    commandline -f repaint
  end
end
