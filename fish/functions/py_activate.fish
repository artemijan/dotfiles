function py_activate
    set possible_dirs (ls -a -1  -D --no-icons | grep -E -i -w "venv|virtualenv")
    for possible_env in $possible_dirs
        if test -e $possible_env"/bin/activate.fish"
            if count $VIRTUAL_ENV > /dev/null
                deactivate
            end
            echo "Activating $possible_env"
            source $possible_env"/bin/activate.fish"
            break
        end
    end
    return 0
end
