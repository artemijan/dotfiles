function fish_user_key_bindings
  # peco
  bind \ch peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
  bind \ef peco_change_directory_list_all # Bind for peco change directory to Alt+F

  # vim-like
  bind \cl forward-char

  # prevent iterm2 from closing when typing Ctrl-D (EOF)
  bind \cd delete-char
end
