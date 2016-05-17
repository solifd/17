unzip faac-1.28.zip
cd faac-1.28
./bootstrap  
./configure --prefix=/usr/local/ --enable-shared
make   
make install
cd ..
rm -rf faac-1.28


tar -zxvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --enable-shared --prefix=/usr/local/ --enable-shared  
make  
make install
cd ..
rm -rf lame-3.99.5

tar zxvf libogg-1.1.3.tar.gz
cd libogg-1.1.3
./configure --prefix=/usr/local/ --enable-shared
make  
make install
cd ..
rm -rf  libogg-1.1.3

#install libtheora

#install libvorbis
yum install libogg-devel -y
tar zxvf libvorbis-1.1.2.tar.gz
cd libvorbis-1.1.2
./configure --prefix=/usr/local/ --enable-shared
make make install 
cd ..
rm -rf  libvorbis-1.1.2

#install vo-aacenc
tar zvxf xvidcore-1.1.3.tar.gz  
cd xvidcore-1.1.3/build/generic  
./configure --prefix=/usr/local/ --enable-shared
make && make install
cd .. 
rm -rf xvidcore-1.1.3

#install yasm
./configure --prefix=/usr/local/ 
make && make install
cd ..
rm -rf yasm-1.2.0

#install x264
tar jxvf x264-snapshot-20140624-2245.tar.bz2
cd x264-snapshot-20140624-2245
./configure --prefix=/usr --enable-shared  
make  
make install
cd ..
rm -rf x264

 






