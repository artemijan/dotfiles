function peco_change_directory_list_all
  begin
   exa --no-permissions --no-user --group-directories-first --no-time --icons --all --all -l --no-filesize
  end | _peco_change_directory $argv
end
