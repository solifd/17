#!/bin/bash
# author: licess
# website: http://www.lnmp.org

CheckURL="http://www.liberalsky.com"

STATUS_CODE=`curl -o /dev/null -m 10 --connect-timeout 10 -s -w %{http_code} $CheckURL`
#echo "$CheckURL Status Code:\t$STATUS_CODE"
if [ "$STATUS_CODE" = "502" ]; then
        reboot
fi
