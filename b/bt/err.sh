echo "/usr/local/lib/" >> /etc/ld.so.conf
ldconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
