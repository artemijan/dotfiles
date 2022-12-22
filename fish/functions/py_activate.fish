function py_activate
    set builtin_ls (which ls)
    set possible_dirs ($builtin_ls -a -1  -d */ .*/ | grep -E -i -w "venv|.venv|virtualenv")
    for possible_env in $possible_dirs
        if test -e $possible_env"bin/activate.fish"
            if count $VIRTUAL_ENV > /dev/null
                deactivate
            end
            echo "Activating $possible_env"
            source $possible_env"bin/activate.fish"
            break
        end
    end
    return 0
end
