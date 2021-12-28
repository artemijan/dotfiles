function _peco_change_directory
  if [ (count $argv) ]
    peco --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'| string split " " -m1 -f2 | awk -v PWD="$PWD" '{print PWD"/"$1}' | string replace -a ' ' '\ '|read foo
  else
    peco |perl -pe 's/([ ()])/\\\\$1/g'| string split " " -m1 -f2 | awk -v PWD="$PWD" '{print PWD"/"$1}' | string replace -a ' ' '\ '|read foo
  end
  if [ $foo ]
    if test -d $foo 
      builtin cd $foo
      commandline -r ''
      commandline -f repaint
      peco_change_directory
    else if test -e $foo
      micro $foo
    end
  else
    commandline ''
  end
end
