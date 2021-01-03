echo /etc/init.d/nscd restart
/etc/init.d/nscd restart
echo /etc/init.d/networking force-reload
/etc/init.d/networking force-reload
echo /etc/init.d/bind9 restart
/etc/init.d/bind9 restart
echo /etc/init.d/isc-dhcp-server restart
/etc/init.d/isc-dhcp-server restart
echo /etc/init.d/firewall.sh restart 
/etc/init.d/firewall.sh restart 
echo arp -i eth1 
arp -i eth1 -v 
