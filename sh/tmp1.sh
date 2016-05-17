sed -i 's/127.0.0.1/198.52.120.48/g' /usr/local/sersync/conf/confxml.xml
 sed -i 's/tongbu1/data/g' /usr/local/sersync/conf/confxml.xml
mkdir /data
echo "export PATH=$PATH:/usr/local/sersync/bin/" >> /etc/profile
source /etc/profile
sersync2 -r -d -o /usr/local/sersync/conf/confxml.xml
echo "sersync2 -r -d -o /usr/local/sersync/conf/confxml.xml" >> /etc/rc.local
cd /data
touch 1 2 3 4 5
echo "test sersync" > 1
