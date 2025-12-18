set -m

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

. "$HOME/.cargo/env"

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac


# . $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
# export PATH="$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.local/bin/claude:$PATH"


. ~/.bash_aliases 

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=$HOME/local/bin:$PATH

eval "$(starship init bash)"

. "$HOME/.cargo/env"

# uv
export PATH="/Users/samvevangsam/.local/bin:$PATH"
eval "$(~/.local/bin/mise activate bash)"


export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig:$HOMEBREW_PREFIX/share/pkgconfig:$PKG_CONFIG_PATH"
export CPPFLAGS="-I$HOMEBREW_PREFIX/include"
export LDFLAGS="-L$HOMEBREW_PREFIX/lib"
export MANPATH="$HOMEBREW_PREFIX/share/man:${MANPATH-}"


export AWS_PROFILE=prx-legacy

# uv
export PATH="/Users/samvevangsam/.local/bin:$PATH"

[ -f ~/.aliases ] && source ~/.aliases
