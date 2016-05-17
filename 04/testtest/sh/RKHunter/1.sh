tar zxvf rkhunter-*.tar.gz
cd rkhunter*
 ./installer.sh  --layout default --install

rm -rf rkhunter-1.4.2 
/usr/local/bin/rkhunter   -c


/usr/local/bin/rkhunter --check --skip-keypress 


#30 09 * * * root /usr/local/bin/rkhunter --check --cronjob
