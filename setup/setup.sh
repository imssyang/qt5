#!/bin/bash

APP=qt5
HOME=/opt/$APP
VER=5.15.5

_mkdir() {
  name=$1
  if [[ ! -d $name ]]; then
    mkdir -p $name
  fi
}

_rmdir() {
  name=$1
  if [[ -d $name ]]; then
    rm -rf $name
  fi
}

_create_symlink() {
  src=$1
  dst=$2
  if [[ ! -d $dst ]] && [[ ! -s $dst ]]; then
    ln -s $src $dst
    echo "($APP) create symlink: $src -> $dst"
  fi
}

_delete_symlink() {
  dst=$1
  if [[ -d $dst ]] || [[ -s $dst ]]; then
    rm -rf $dst
    echo "($APP) delete symlink: $dst"
  fi
}

init() {
  chown -R root:root $HOME
  chmod 755 $HOME
}

deinit() {
  echo
}

install() {
  install -v -dm755 /usr/share/pixmaps
  install -v -Dm644 $HOME/meta/images/assistant-128.png    /usr/share/pixmaps/qt5-assistant.png
  install -v -Dm644 $HOME/meta/images/designer.png         /usr/share/pixmaps/qt5-designer.png
  install -v -Dm644 $HOME/meta/images/linguist-128-32.png  /usr/share/pixmaps/qt5-linguist.png
  install -v -Dm644 $HOME/meta/images/qdbusviewer-128.png  /usr/share/pixmaps/qt5-qdbusviewer.png
  install -dm755 /usr/share/applications
  cp $HOME/meta/applications/*.desktop /usr/share/applications
}

archive() {
  7z a -mx9 -mmt4 $HOME/archive/qt5-$VER-doc.7z $HOME/share/doc
}

case "$1" in
  init) init ;;
  deinit) deinit ;;
  install) install ;;
  archive) archive ;;
  *) SCRIPTNAME="${0##*/}"
    echo "Usage: $SCRIPTNAME {init|deinit|install|archive}"
    exit 3
    ;;
esac

exit 0

# vim: syntax=sh ts=4 sw=4 sts=4 sr noet
