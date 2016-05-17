yum -y install sendmail
/etc/rc.d/init.d/sendmail start
chkconfig sendmail on
/etc/rc.d/init.d/sendmail status
hostname solifd.com
yum install -y mutt vixie-cron

echo "set envelope_from=yes" >> ~/.muttrc
echo "set from=linode@liberalsky.com" >> ~/.muttrc
echo "set realname="linode"" >> ~/.muttrc
echo "set use_from=yes" >> ~/.muttrc
