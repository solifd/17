echo "input what time you want to do:"
read what
echo "${what}" >> /etc/crontab
/etc/init.d/crond restart
cat /etc/crontab
#tail -100 /var/log/cron
