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

_archive_item() {
  fpath=$1
  fdir=$(dirname $fpath)
  fname=$(basename $fpath)
  if [[ ! -f $HOME/archive/$APP-$fname-$VER.7z ]]; then
    echo "($APP) archive $fpath"
    7z a -mx9 -mmt4 $HOME/archive/$APP-$fname-$VER.7z $fpath
  fi
}

_unarchive_item() {
  fpath=$1
  fdir=$(dirname $fpath)
  fname=$(basename $fpath)
  if [[ ! -f $fpath ]] && [[ ! -d $fpath ]]; then
    echo "($APP) unarchive $HOME/archive/$APP-$fname-$VER.7z -> $fpath"
    7z x $HOME/archive/$APP-$fname-$VER.7z -o$fdir
  fi
}

_large_files=(
  $HOME/share/doc
  $HOME/share/examples
)

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
  for fpath in "${_large_files[@]}"; do
    _archive_item $fpath
  done
}

unarchive() {
  for fpath in "${_large_files[@]}"; do
    _unarchive_item $fpath
  done
}

show() {
  for fpath in "${_large_files[@]}"; do
    echo $fpath
  done
}

case "$1" in
  init) init ;;
  deinit) deinit ;;
  install) install ;;
  archive) archive ;;
  unarchive) unarchive ;;
  show) show ;;
  *) SCRIPTNAME="${0##*/}"
    echo "Usage: $SCRIPTNAME {init|deinit|install|archive|unarchive|show}"
    exit 3
    ;;
esac

exit 0

# vim: syntax=sh ts=4 sw=4 sts=4 sr noet
