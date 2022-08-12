#!/bin/bash

export QT5_DISABLE_ENV=yes
export QT_PLUGIN_PATH=/opt/qt5/plugins
eval "optbin -s /opt/qt5/bin"
eval "optlib -s /opt/qt5/lib"
eval "optpkg -s /opt/qt5/lib/pkgconfig"
