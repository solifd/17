yum install libpcap libpcap-devel
#./libpcap.sh
./libdnet.sh
./daq.sh
groupadd snort
useradd -g snort snort -s/sbin/nologin
./snort.sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
cp libdnet libdnet.so
cp libdnet.1 libdnet.1.so
ldconfig
rm -rf daq-2.0.2  guardian-1.6  libdnet-1.11  libpcap-1.5.3 snort-2.9.6.1
