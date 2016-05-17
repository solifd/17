#!/bin/bash

function start(){
        echo "service vncserver start";
        #check wether vps suppot ppp and tun

service vncserver start

        echo "VPN service is installed, service vncserver starton"

}
function stop(){
        echo "service vncserver stop";
        #check wether vps suppot ppp and tun

service vncserver stop

        echo "VPN service is installed, service vncserver starton"

}

echo "which do you want to?input the number."
echo "1.service vncserver start"
echo "2.service vncserver stop"

read num

case "$num" in
[1] ) (start);;
[2] ) (stop);;

*) echo "nothing,exit";;
esac
