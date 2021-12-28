#!/usr/bin/env zsh
# bindings 
zle -N p_change_dir peco_change_directory
zle -N p_change_dir_all peco_change_directory_list_all
zle -N p_select_history peco_select_history
bindkey '^f' 'p_change_dir'
bindkey '\eF' 'p_change_dir_all'
bindkey '^h' 'p_select_history'
