#!/bin/bash

function installcrontab(){
        yum -y install vixie-cron crontabs
        service crond start
        chkconfig --level 345 crond on
       }
function startcrontab(){
        service crond start
    
       }
function stopcrontab(){
        service crond stop
    
       }
function restartcrontab(){
       service crond restart
       }
function reloadcrontab(){
        service crond reload
       }
function statuscrontab(){
        service crond status
       }
echo "which do you want to?input the number."
echo "1. installcrontab"
echo "2. service crond start     //启动服务"
echo "3. service crond stop      //关闭服务"
echo "4. service crond restart   //重启服务"
echo "5.service crond reload    //重新载入配置"
echo "6.service crond status    //查看crontab服务状态"

read num

case "$num" in
[1] ) (installcrontab);;
[2] ) (startcrontab);;
[3] ) (stopcrontab);;
[4] ) (restartcrontab);;
[5] ) (reloadcrontab);;
[6] ) (statuscrontab);;
*) echo "nothing,exit";;
esac
