sh /shell/dropbox_uploader.sh download nginx.tar.gz nginx.tar.gz
tar zxvf nginx.tar.gz
cd nginx
./libunwind.sh
./gperftools.sh
./nginx.sh
cd ..
rm -rf nginx nginx.tar.gz
