mkdir /usr/local/sersync

mkdir /usr/local/sersync/conf

mkdir /usr/local/sersync/bin

mkdir /usr/local/sersync/log

tar zxvf sersync2.5_32bit_binary_stable_final.tar.gz

cd GNU-Linux-x86/

cp confxml.xml /usr/local/sersync/conf

cp sersync2 /usr/local/sersync/bin

echo "123456" >/etc/rsync.pas

chmod 600 /etc/rsync.pas
