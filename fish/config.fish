if status is-interactive
    # Commands to run in interactive sessions can go here
end
if type -q exa
  alias ls "exa --icons"
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end
alias fish_conf "micro ~/.config/fish/config.fish"
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--enable-loadable-sqlite-extensions --enable-optimizations --with-openssl=(brew --prefix openssl)"

starship init fish | source
export DYLD_LIBRARY_PATH=/opt/homebrew/lib
export EDITOR=micro
export NVM_DIR="$HOME/.nvm"
