function peco_change_directory
    begin
        exa --no-permissions --no-user --group-directories-first --no-time --icons -l --no-filesize --all --all | grep -P '^.{1}\s(\\.\\.|[^\\.])'
    end | _peco_change_directory $argv
end
