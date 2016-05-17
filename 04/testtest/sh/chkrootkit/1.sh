tar zxvf chkrootkit.tar.gz
yum install glibc-static -y
cd chkrootkit-*
make sense
cd ..
cp -r chkrootkit-* /usr/local/chkrootkit
mkdir /usr/share/.commands
cp `which --skip-alias awk cut echo find egrep id head ls netstat ps strings sed uname` /usr/share/.commands
/usr/local/chkrootkit/chkrootkit -p /usr/share/.commands/
cd /usr/share/
tar zcvf commands.tar.gz .commands

