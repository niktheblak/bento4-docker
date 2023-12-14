#!/usr/bin/env bash

if [[ -z "$INSTALL_TOOLS" ]]; then
  INSTALL_TOOLS=0
fi

if [[ ! -d "$HOME/bin" ]]; then
  mkdir -p "$HOME/bin"
fi

ln -s "$PWD/bento4" "$HOME/bin/bento4"

if [[ "$INSTALL_TOOLS" -eq 1 ]]; then
  ln -s "$PWD/mp4info" "$HOME/bin/mp4info"
  ln -s "$PWD/mp4dump" "$HOME/bin/mp4dump"
  ln -s "$PWD/mp4edit" "$HOME/bin/mp4edit"
  ln -s "$PWD/mp4extract" "$HOME/bin/mp4extract"
  ln -s "$PWD/mp4encrypt" "$HOME/bin/mp4encrypt"
  ln -s "$PWD/mp4decrypt" "$HOME/bin/mp4decrypt"
  ln -s "$PWD/mp4dcfpackager" "$HOME/bin/mp4dcfpackager"
  ln -s "$PWD/mp4compact" "$HOME/bin/mp4compact"
  ln -s "$PWD/mp4fragment" "$HOME/bin/mp4fragment"
  ln -s "$PWD/mp4split" "$HOME/bin/mp4split"
  ln -s "$PWD/mp4tag" "$HOME/bin/mp4tag"
  ln -s "$PWD/mp4mux" "$HOME/bin/mp4mux"
  ln -s "$PWD/mp42aac" "$HOME/bin/mp42aac"
  ln -s "$PWD/mp42avc" "$HOME/bin/mp42avc"
  ln -s "$PWD/mp42hls" "$HOME/bin/mp42hls"
  ln -s "$PWD/mp42ts" "$HOME/bin/mp42ts"
  ln -s "$PWD/mp4-dash" "$HOME/bin/mp4-dash"
  ln -s "$PWD/mp4-dash-clone" "$HOME/bin/mp4-dash-clone"
fi
