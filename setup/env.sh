#!/bin/bash

export QT5_DISABLE_ENV=yes
export QT_PLUGIN_PATH=/opt/qt5/plugins
eval "optbin -s /opt/qt5/bin"
eval "optlib -s /opt/qt5/lib"
#eval "optlib -s /opt/qt5/plugins/assetimporters"
#eval "optlib -s /opt/qt5/plugins/audio"
#eval "optlib -s /opt/qt5/plugins/bearer"
#eval "optlib -s /opt/qt5/plugins/canbus"
#eval "optlib -s /opt/qt5/plugins/designer"
#eval "optlib -s /opt/qt5/plugins/egldeviceintegrations"
#eval "optlib -s /opt/qt5/plugins/gamepads"
#eval "optlib -s /opt/qt5/plugins/generic"
#eval "optlib -s /opt/qt5/plugins/geometryloaders"
#eval "optlib -s /opt/qt5/plugins/geoservices"
#eval "optlib -s /opt/qt5/plugins/iconengines"
#eval "optlib -s /opt/qt5/plugins/imageformats"
#eval "optlib -s /opt/qt5/plugins/mediaservice"
#eval "optlib -s /opt/qt5/plugins/platforminputcontexts"
#eval "optlib -s /opt/qt5/plugins/platforms"
#eval "optlib -s /opt/qt5/plugins/platformthemes"
#eval "optlib -s /opt/qt5/plugins/playlistformats"
#eval "optlib -s /opt/qt5/plugins/position"
#eval "optlib -s /opt/qt5/plugins/qmltooling"
#eval "optlib -s /opt/qt5/plugins/renderers"
#eval "optlib -s /opt/qt5/plugins/renderplugins"
#eval "optlib -s /opt/qt5/plugins/sceneparsers"
#eval "optlib -s /opt/qt5/plugins/sensorgestures"
#eval "optlib -s /opt/qt5/plugins/sensors"
#eval "optlib -s /opt/qt5/plugins/sqldrivers"
#eval "optlib -s /opt/qt5/plugins/virtualkeyboard"
#eval "optlib -s /opt/qt5/plugins/wayland-decoration-client"
#eval "optlib -s /opt/qt5/plugins/wayland-graphics-integration-client"
#eval "optlib -s /opt/qt5/plugins/wayland-graphics-integration-server"
#eval "optlib -s /opt/qt5/plugins/wayland-shell-integration"
eval "optpkg -s /opt/qt5/lib/pkgconfig"
