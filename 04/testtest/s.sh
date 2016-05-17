cd /etc/
rm -f   cron.deny at.deny
echo root   >cron.allow
echo root   >at.allow
chown   root:root cron.allow at.allow
chmod 400   cron.allow at.allow
chown   root:root /etc/crontab
chmod 400   /etc/crontab
chown -R   root:root /var/spool/cron
chmod -R   go-rwx /var/spool/cron
chown -R   root:root /etc/cron.*
chmod -R   go-rwx /etc/cron.*
#限制root登录到系统控制台
cat   <<END_FILE >/etc/securetty
tty1
tty2
tty3
tty4
tty5
tty6
END_FILE
chown   root:root /etc/securetty
chmod 400   /etc/securetty
