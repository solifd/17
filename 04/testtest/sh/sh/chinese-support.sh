yum -y groupinstall chinese-support
sed -i '1,$d' /etc/sysconfig/i18n
echo "LANGUAGE="zh_CN.GB18030:zh_CN.GB2312:zh_CN"" >> /etc/sysconfig/i18n
echo "SUPPORTED="zh_CN.GB18030:zh_CN:zh:en_US.UTF-8:en_US:en"" >> /etc/sysconfig/i18n
echo "SYSFONT="lat0-sun16"" >> /etc/sysconfig/i18n
echo "export LC_ALL="zh_CN.GB18030"" >> /etc/sysconfig/i18n
reboot
