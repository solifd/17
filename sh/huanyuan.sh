dd if=root20131129.des3 |openssl des3 -d -k ra5i27mytd|tar zxf -
cd /root/myvpsfilesbackups/vps-backups/root && mv * /root && rm -rf /root/myvpsfilesbackups/vps-backups/root*
cd /root/myvpsfilesbackups/vps-backups/ && cat wwwroot20131129.part* > wwwroot.des3 && rm -rf /root/myvpsfilesbackups/vps-backups/wwwroot20131129.part* && dd if=wwwroot.des3 |openssl des3 -d -k 5zq2o3y5ec|tar zxf - && rm -rf /home && mv /root/myvpsfilesbackups/vps-backups/home / && rm -rf /root/myvpsfilesbackups/vps-backups/wwwroot.des3
