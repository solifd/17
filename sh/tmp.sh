


 yum install rsync -y

 yum install xinetd -y




 /etc/init.d/xinetd start

 chkconfig xinetd on
 
touch /etc/rsyncd.conf

cat >>/etc/rsyncd.conf<<-EOF
uid = root

gid = root

use chroot = no

max connections = 10

strict modes = yes

port = 873

address = 122.10.94.227
[data] # rsync模块名，后面配置sersync会用到

path = /data  # 该同步目录只要uid所指定的用户有写权限即可

comment = mirror for test

ignore errors

read only = no

list = no

auth users = user

secrets file = /etc/rsync.pas # 密码认证文件，必须为600权限，否则rsync传输会报错

hosts allow = *

# hosts deny = 0.0.0.0/0

pid file = /var/run/rsyncd.pid

lock file = /var/run/rsync.lock

log file = /var/log/rsyncd.log
EOF

mkdir /data

echo "user:123456" > /etc/rsync.pas

chmod 600 /etc/rsync.pas

rsync --daemon --config=/etc/rsyncd.conf
/etc/init.d/xinetd restart
echo "rsync --daemon --config=/etc/rsyncd.conf" >> /etc/rc.local
