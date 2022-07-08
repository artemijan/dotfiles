function exa_path
    set -l a
    while read line
        set a $a $line
    end
    echo $a | perl -pe 's/([ ()])/\\\\$1/g' | string split " " -m1 -f2 | awk -v PWD="$PWD" '{print PWD"/"$0}' | string unescape | read x
    echo $x
end
