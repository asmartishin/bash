Simple Firewall Script.
#Блокировка по ip: iptables -I INPUT -s {IP-HERE} -j DROP
#Блокировка по интерфейсу: iptables -I INPUT -i {INTERFACE-NAME-HERE} -s {IP-HERE} -j DROP
#Блокировка по порту: iptables -A INPUT -p {PROTOCOL-NAME-HERE} --dport {PORT-NAME-HERE} -j DROP
#Заблокировать исходяший трафик по ip: iptables -A OUTPUT -p {PROTOCOL-NAME-HERE} -d {IP-HERE/SUBNET-MASK} -j DROP
#Setting up default kernel tunings here (don't worry too much about these right now, they are acceptable defaults) #DROP ICMP echo-requests sent to broadcast/multi-cast addresses.
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
#DROP source routed packets
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
#Enable TCP SYN cookies
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
#Do not ACCEPT ICMP redirect
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
#Don't send ICMP redirect
echo 0 >/proc/sys/net/ipv4/conf/all/send_redirects
#Enable source spoofing protection
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
#Log impossible (martian) packets
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

#Flush all existing chains
iptables --flush

#Allow traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#Creating default policies
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP #If we're not a router

#Allow previously established connections to continue uninterupted
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#Allow outbound connections on the ports we previously decided.
iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT #SMTP
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT #DNS
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT #HTTP
iptables -A OUTPUT -p tcp --dport 110 -j ACCEPT #POP
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT #HTTPS
iptables -A OUTPUT -p tcp --dport 51413 -j ACCEPT #BT
iptables -A OUTPUT -p tcp --dport 6969 -j ACCEPT #BT tracker
iptables -A OUTPUT -p UDP --dport 67:68 -j ACCEPT #DHCP
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT #DNS
iptables -A OUTPUT -p udp --dport 51413 -j ACCEPT #BT

#Set up logging for incoming traffic.
iptables -N LOGNDROP
iptables -A INPUT -j LOGNDROP
iptables -A LOGNDROP -j LOG
iptables -A LOGNDROP -j DROP

#Save our firewall rules
iptables-save > /etc/iptables.rules
