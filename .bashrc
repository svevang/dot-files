# Enable .bashrc for non-interactive shells
export BASH_ENV=~/.bashrc

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Cargo/Rust
. "$HOME/.cargo/env"

# PATH additions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/claude:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"

# Mise - shims for non-interactive shells
eval "$(~/.local/bin/mise activate bash --shims)"

# Exit here if non-interactive
case $- in
  *i*) ;;
    *) return;;
esac

# ---- Interactive-only below ----

set -m

# Bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

# Mise - full activation for interactive shells (auto-switch on cd, etc.)
eval "$(~/.local/bin/mise activate bash)"

# Prompt
eval "$(starship init bash)"

# Aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.aliases ] && source ~/.aliases

# Compiler/linker flags
export C_INCLUDE_PATH="$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig:$HOMEBREW_PREFIX/share/pkgconfig:$PKG_CONFIG_PATH"
export CPPFLAGS="-I$HOMEBREW_PREFIX/include"
export LDFLAGS="-L$HOMEBREW_PREFIX/lib"
export MANPATH="$HOMEBREW_PREFIX/share/man:${MANPATH-}"

# AWS
export AWS_PROFILE=prx-legacy
