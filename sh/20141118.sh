cat >>/etc/sysconfig/vncservers<<-EOF
VNCSERVERS="1:root"
VNCSERVERARGS[1]="-geometry 800x600 "
EOF

cp /root/.vnc/xstartup /root/.vnc/xstartup.old
sed -i '1,$d' /root/.vnc/xstartup
cat /root/.vnc/xstartup

cat >>/root/.vnc/xstartup<<-EOF
#!/bin/sh
# Uncomment the following two lines for normal desktop:
unset SESSION_MANAGER
#exec /etc/X11/xinit/xinitrc
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
#xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#twm &
startxfce4 &
EOF
