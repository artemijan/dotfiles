if status is-interactive
    # Commands to run in interactive sessions can go here
end
if type -q exa
  alias ls "exa --icons"
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end
alias fish_conf "micro ~/.config/fish/config.fish"
alias codehere "code . && exit"
alias cls="printf '\33c\e[3J'"
set -gx NVM_NODEJS_ORG_MIRROR "http://nodejs.org/dist" 
#set -gx LDFLAGS "-L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/openssl@3/lib"
#set -gx CPPFLAGS "-I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/openssl@3/include"
#set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/sqlite/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig"
#set -gx PYTHON_CONFIGURE_OPTS "--enable-loadable-sqlite-extensions --enable-optimizations --with-openssl=(brew --prefix openssl)"
set -gx LC_CTYPE 'en_US.UTF-8'
set -gx LC_ALL 'en_US.UTF-8'
set -gx LANG 'en_US.UTF-8'
set -gx DYLD_FALLBACK_LIBRARY_PATH /opt/local/lib
set -gx EDITOR micro
set -gx GRAPHVIZ_DOT "/opt/homebrew/bin/dot"
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
pyenv init --path | source

function brew
    set -xl PATH $PATH # Protect global PATH by local PATH
    if type -q pyenv; and contains (pyenv root)/shims $PATH
        set -e PATH[(contains -i (pyenv root)/shims $PATH)]
    end

    command brew $argv
end
direnv hook fish | source
