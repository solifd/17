btime=600
while true;do
while inotifywait -q -q -e modify /var/log/iptables.log;do
ip=`tail -1 /var/log/iptables.log | awk -F"[ =]" '{print $13}' | grep '\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}'`
if test -z "`/sbin/iptables -nL | grep $ip`";then
/sbin/iptables -I INPUT -s $ip -j DROP
{
sleep $btime && /sbin/iptables -D INPUT -s $ip -j DROP
} &
        fi
   done
done
