#!/bin/sh

set -e
setopt EXTENDED_GLOB

export INSTALL_DIR=${INSTALL_DIR:-$HOME}
export DOTFILES_DIR=${DOTFILES_DIR:-$HOME/.dotfiles}

echo "Linking the rest of the dotfiles..."
for FILE in $DOTFILES_DIR/(.??*)(.N); do
  local TARGET=$INSTALL_DIR/${FILE:t}
  if [[ ! -a $INSTALL_DIR/${FILE:t} ]]; then
    print -P -- "  %F{002}Linking file:%f $FILE => $TARGET"
    ln -s $FILE $INSTALL_DIR/${FILE:t}
  else
    print -P -- "  %F{011}Link already exists:%f $FILE => $TARGET"
  fi
done