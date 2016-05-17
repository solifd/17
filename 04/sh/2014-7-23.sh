#snort
cd /var/log
mkdir snort
chmod 700 snort
chown -R snort:snort snort
cd /usr/local/lib
chown -R snort:snort snort*
chown -R snort:snort snort_dynamic*
chown -R snort:snort pkgconfig
chmod -R 700 snort*
chmod -R 700 pkgconfig
cd /usr/local/bin
chown -R snort:snort daq-modules-config
chown -R snort:snort u2*
chmod -R 700 daq-modules-config
chmod 700 u2*
cd /etc
chown -R snort:snort snort
chmod -R 700 snort
#系统已运行时间
cat /proc/uptime| awk -F. '{run_days=$1 / 86400;run_hour=($1 % 86400)/3600;run_minute=($1 % 3600)/60;run_second=$1 % 60;printf("系统已运行：%d天%d时%d分%d秒",run_days,run_hour,run_minute,run_second)}'
