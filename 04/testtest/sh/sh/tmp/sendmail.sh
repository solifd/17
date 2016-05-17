yum -y install sendmail
service sendmail start
chkconfig sendmail on
service sendmail status
yum -y install logwatch
sed -i 's/MailTo = root/MailTo = solidfd@gmail.com/g' /usr/share/logwatch/default.conf/logwatch.conf
