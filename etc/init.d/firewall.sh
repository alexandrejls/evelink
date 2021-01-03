#!/bin/bash
case "$1" in
	start)
	iptables -F 
	iptables -X 
	iptables -t nat -F 
	iptables -t nat -X
	echo "1" > /proc/sys/net/ipv4/ip_forward # Libera encaminhamento de pacotes
# Politica INPUT Entrada
# iptables -P INPUT DROP # Nega tudo

### Regras INPUT ###
### Knocking esconder o SSH de ataques ###
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT		# Porta http
iptables -A INPUT -p tcp --dport 443 -j ACCEPT		# Porta https
#iptables -A INPUT -p icmp --icmp -j ACCEPT
#iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
#iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
### Knocking esconder o SSH de ataques ###
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT		# Porta FTP
iptables -A INPUT -p udp --dport 21 -j ACCEPT		# Porta FTP
iptables -A INPUT -p udp --dport 53 -j ACCEPT		# Porta DNS
iptables -A INPUT -p tcp --dport 53 -j ACCEPT		# Porta DNS
iptables -A INPUT -p udp --sport 53 -j ACCEPT		# Porta DNS
iptables -A INPUT -p tcp --sport 53 -j ACCEPT		# Porta DNS
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp --dport 139 -j ACCEPT		# Porta DNS
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j ACCEPT		# Porta DNS
iptables -A INPUT -p udp --dport 445 -j ACCEPT		# Porta DNS
iptables -A INPUT -p tcp --dport 631 -j ACCEPT		# Porta Print
iptables -A INPUT -p udp --dport 631 -j ACCEPT		# Porta Print
iptables -A INPUT -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -p tcp --dport 1194 -j ACCEPT
iptables -A INPUT -p tcp --dport 2222 -j ACCEPT 	# Porta SSH
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT 	# Porta MySQL
iptables -A INPUT -p udp --dport 9090 -j ACCEPT 	# Porta Spark
iptables -A INPUT -p tcp --dport 9090 -j ACCEPT 	# Porta Spark
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT	# Porta Webmin
iptables -A INPUT -p udp --dport 10000 -j ACCEPT	# Porta Webim
#iptables -A INPUT -j DROP
# Politica FORWARD Encaminhamento
# iptables -P FORWARD DROP # Nega tudo
### Regras FORWARD ###
iptables -A FORWARD -s 192.168.21.0/24 -p tcp --dport 443 -j ACCEPT # https
iptables -A FORWARD -p icmp -j ACCEPT 				# Encaminha ping externo
iptables -A FORWARD -p udp --dport 53 -j ACCEPT 	# Aceita ping externo por nome do site
iptables -A FORWARD -p udp --sport 53 -j ACCEPT 	# Aceita ping externo por nome do site
iptables -A FORWARD -p tcp --dport 53 -j ACCEPT 	# Aceita ping externo por nome do site
iptables -A FORWARD -p tcp --sport 53 -j ACCEPT 	# Aceita ping externo por nome do site
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT 	# Encaminha porta 80(HTTP)
iptables -A FORWARD -p tcp --dport 139 -j ACCEPT 	# samba
iptables -A FORWARD -p udp --dport 139 -j ACCEPT 	# samba
iptables -A FORWARD -p tcp --dport 443 -j ACCEPT 	# Encaminha porta 443(HTTPS)
iptables -A FORWARD -p tcp --dport 445 -j ACCEPT 	# samba
iptables -A FORWARD -p udp --dport 445 -j ACCEPT 	# samba


##### CAMERAS ######
####################
iptables -A FORWARD -p tcp --dport 8000 -j ACCEPT   # DENISE
iptables -A FORWARD -p tcp --dport 8020 -j ACCEPT   # DVR MJC
iptables -A FORWARD -p tcp --dport 8021 -j ACCEPT   # DVR MJC
iptables -A FORWARD -p tcp --dport 8061 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8062 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8063 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8064 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8065 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8066 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8067 -j ACCEPT   # DVR ADM MERCADAO
iptables -A FORWARD -p tcp --dport 8109 -j ACCEPT   # SORELLE
iptables -A FORWARD -p tcp --dport 8119 -j ACCEPT   # VIMARGATO
iptables -A FORWARD -p tcp --dport 8108 -j ACCEPT   # Alegria dos Baixinhos
iptables -A FORWARD -p tcp --dport 8123 -j ACCEPT   # luxmakeup1agl 123
#iptables -A FORWARD -p tcp --dport 8189 -j ACCEPT   # Erivaldo Cam Gal G
iptables -A FORWARD -p tcp --dport 8207 -j ACCEPT   # Tagarela 
iptables -A FORWARD -p tcp --dport 8212 -j ACCEPT   # HIPER DAS MAQUINAS
iptables -A FORWARD -p tcp --dport 8229 -j ACCEPT   ## Lyra 2a Gal B - OK
iptables -A FORWARD -p udp --dport 8229 -j ACCEPT   ## Lyra 2a Gal B - OK
iptables -A FORWARD -p tcp --dport 8247 -j ACCEPT   # NOVO TEROB
iptables -A FORWARD -p tcp --dport 8249 -j ACCEPT   # BRUNINHA
iptables -A FORWARD -p tcp --dport 8250 -j ACCEPT   # HORTIFRUT 
iptables -A FORWARD -p tcp --dport 8251 -j ACCEPT   # FENIX TABACARIA GalG
iptables -A FORWARD -p tcp --dport 9000 -j ACCEPT   # VIMAGARTO  Gal B 119 
iptables -A FORWARD -p tcp --dport 9207 -j ACCEPT   # Tagarela 
iptables -A FORWARD -p tcp --dport 34567 -j ACCEPT  # HIPER DAS MAQUINAS
iptables -A FORWARD -p tcp --dport 34569 -j ACCEPT  # FENIX TABACARIA GalG
iptables -A FORWARD -p tcp --dport 34571 -j ACCEPT  # TOCA DO CAÃƒâ€¡ADOR
iptables -A FORWARD -p tcp --dport 34576 -j ACCEPT  # NOVO TEROB
iptables -A FORWARD -p tcp --dport 37777 -j ACCEPT  # atacadao
### Regras NAT ###
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8020 -j DNAT --to 192.168.21.20:8020 		# DVR MJC
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8021 -j DNAT --to 192.168.21.20:8021 		# DVR MJC
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8000 -j DNAT --to 192.168.21.107:8000 		# BRUNINHA
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8001 -j DNAT --to 192.168.21.123:8001 		# luxmakeup1agl
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8061 -j DNAT --to 192.168.21.61:8061 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8062 -j DNAT --to 192.168.21.61:8062 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8063 -j DNAT --to 192.168.21.61:8063 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8064 -j DNAT --to 192.168.21.61:8064 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8065 -j DNAT --to 192.168.21.61:8065 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8066 -j DNAT --to 192.168.21.61:8066 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8067 -j DNAT --to 192.168.21.61:8067 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8068 -j DNAT --to 192.168.21.61:8068 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8069 -j DNAT --to 192.168.21.61:8069 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8070 -j DNAT --to 192.168.21.61:8070 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8071 -j DNAT --to 192.168.21.61:8071 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8072 -j DNAT --to 192.168.21.61:8072 		# DVR MERCADAO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8108 -j DNAT --to 192.168.21.198:8108 		# Alegria dos baixinhos
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8109 -j DNAT --to 192.168.21.131:8109 		# SORELLE
#iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8189 -j DNAT --to 192.168.21.89:8189 		# Erivaldo Cam - Gal G
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8119 -j DNAT --to 192.168.21.119:8119 		# VIMARGATO
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8207 -j DNAT --to 192.168.21.207:8207  	# Tagarela
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8229 -j DNAT --to 192.168.21.229:8229 		# Lyra 2a Gal B
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8245 -j DNAT --to 192.168.21.212:8245 		# HIPER DAS MAQUINAS
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8247 -j DNAT --to 192.168.21.102:8247 		# NOVO TEROB
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8249 -j DNAT --to 192.168.21.107:8249 		# BRUNINHA
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8251 -j DNAT --to 192.168.21.106:8251 		# FENIX TABACARIA GalG
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 9207 -j DNAT --to 192.168.21.207:9207  	# Tagarela
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 34567 -j DNAT --to 192.168.21.212:34567 	# HIPER DAS MAQUINAS
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 34568 -j DNAT --to 192.168.21.246:34568 	# TRICANA
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 34569 -j DNAT --to 192.168.21.106:34569 	# FENIX TABACARIA GalG
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 34570 -j DNAT --to 192.168.21.222:34571 	# TOCA DO CAÃƒâ€¡ADOR
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 34576 -j DNAT --to 192.168.21.102:34576 	# NOVO TEROB
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 37777 -j DNAT --to 192.168.21.140:37777 	# atacadao
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128 # redirecionamento de porta 80 para 3128 squid
#iptables -A PREROUTING -t nat -i eth0 -p udp --dport 80 -j REDIRECT --to-port 3128 # redirecionamento de porta 80 para 3128 squid
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE # Libera/mascarar internet

/etc/init.d/firewall.sh block
################################# NEGANDO  SITES ################################################################################
#iptables -A FORWARD -m string --algo bm --string "checkip.dyndns.org" -j DROP
#iptables -A FORWARD -m string --algo bm --string "dyndns.org" -j DROP
#iptables -A FORWARD -m string --algo bm --string "members.dyndns.org" -j DROP
;;
	block)
#iptables -I INPUT -s 192.168.21.250 -j DROP
#iptables -t filter -I FORWARD -m mac --mac-source 10:78:d2:b7:c8:2e -j DROP 
#iptables -I INPUT -s 192.168.21.4 -j DROP
#iptables -t filter -I FORWARD -m mac --mac-source 1c:87:2c:c5:78:09 -j DROP 

### DVR ###
#iptables -A INPUT -p tcp -s 192.168.21.20 -j DROP
#iptables -A INPUT -p udp -s 192.168.21.20 -j DROP
#iptables -A INPUT -i eth0 -s 192.168.21.20 -j DROP
#iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.20 -j DROP
#iptables -A FORWARD -p udp -i eth0 -s 192.168.21.20 -j DROP
#iptables -t filter -I FORWARD -m mac --mac-source 90:02:a9:81:99:74 -j DROP 
#iptables -I INPUT -s 192.168.21.20 -j DROP

####################################
#iptables -I INPUT -s 192.168.21.8 -j DROP
#iptables -t filter -I FORWARD -m mac --mac-source 84:8f:69:b5:e4:c5 -j DROP 
##iptables -t filter -I FORWARD -m mac --mac-source 00:25:22:42:cb:3f -j DROP 
#

iptables -A FORWARD -o 192.168.21.250 -p tcp -j DROP # 192.168.21.250
iptables -A FORWARD -s 192.168.21.250 -p tcp -j DROP # 192.168.21.250
iptables -A FORWARD -o 192.168.21.250 -p udp -j DROP # 192.168.21.250
iptables -A FORWARD -s 192.168.21.250 -p udp -j DROP # 192.168.21.250
iptables -A OUTPUT -o 192.168.21.250 -p tcp -j DROP # 192.168.21.250
iptables -A OUTPUT -s 192.168.21.250 -p tcp -j DROP # 192.168.21.250
iptables -A OUTPUT -o 192.168.21.250 -p udp -j DROP # 192.168.21.250
iptables -A OUTPUT -s 192.168.21.250 -p udp -j DROP # 192.168.21.250
iptables -A INPUT -s 192.168.21.250 -p tcp -j DROP # 192.168.21.250
iptables -A INPUT -s 192.168.21.250 -p udp -j DROP # 192.168.21.250


#iptables -A OUTPUT -d "members.multilaserddns.com.br" -p tcp -j DROP
#iptables -A OUTPUT -d "checkip.dyndns.org" -p tcp -j DROP
#iptables -A OUTPUT -d "members.dyndns.org" -p tcp -j DROP
#iptables -A OUTPUT -d "ddns.luxvision.com.br" -p tcp -j DROP
#iptables -A OUTPUT -d "ddns-intelbras.com.br" -p tcp -j DROP
#iptables -A OUTPUT -d "msftconnecttest.com" -p tcp -j DROP
#iptables -A OUTPUT -d "msftconnecttest.com" -p udp -j DROP
#iptables -A OUTPUT -d "netflix.com" -p tcp -j DROP
#iptables -A OUTPUT -d "spotify.com" -p tcp -j DROP
#iptables -A FORWARD -m string --algo bm --string "spotify.com" -j DROP
;;
	stop)
	iptables -F 
	iptables -X 
	iptables -t nat -F 
	iptables -t nat -X
    echo "0" > /proc/sys/net/ipv4/ip_forward  # Libera encaminhamento de pacotes
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE # Libera/mascarar internet
#/etc/init.d/squid3 stop
#/etc/init.d/isc-dhcp-server stop
;;
	blockip)
   
###ip6
iptables -A INPUT -p tcp -s 192.168.21.6 -j DROP
iptables -A INPUT -p udp -s 192.168.21.6 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.6 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.6 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.6 -j DROP
###ip7
iptables -A INPUT -p tcp -s 192.168.21.7 -j DROP
iptables -A INPUT -p udp -s 192.168.21.7 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.7 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.7 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.7 -j DROP
###ip8
iptables -A INPUT -p tcp -s 192.168.21.8 -j DROP
iptables -A INPUT -p udp -s 192.168.21.8 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.8 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.8 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.8 -j DROP
###ip9
iptables -A INPUT -p tcp -s 192.168.21.9 -j DROP
iptables -A INPUT -p udp -s 192.168.21.9 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.9 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.9 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.9 -j DROP
###ip14
iptables -A INPUT -p tcp -s 192.168.21.14 -j DROP
iptables -A INPUT -p udp -s 192.168.21.14 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.14 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.14 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.14 -j DROP
###ip17
iptables -A INPUT -p tcp -s 192.168.21.17 -j DROP
iptables -A INPUT -p udp -s 192.168.21.17 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.17 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.17 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.17 -j DROP
###ip18
iptables -A INPUT -p tcp -s 192.168.21.18 -j DROP
iptables -A INPUT -p udp -s 192.168.21.18 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.18 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.18 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.18 -j DROP
###ip19
iptables -A INPUT -p tcp -s 192.168.21.19 -j DROP
iptables -A INPUT -p udp -s 192.168.21.19 -j DROP
iptables -A INPUT -i eth0 -s 192.168.21.19 -j DROP
iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.19 -j DROP
iptables -A FORWARD -p udp -i eth0 -s 192.168.21.19 -j DROP


#### Casa do Boiadeiro ####
#iptables -t filter -I FORWARD -m mac --mac-source 00:e0:4c:45:22:8f -j DROP
#iptables -A FORWARD -o 192.168.21.221 -p tcp -j DROP 
#iptables -A FORWARD -s 192.168.21.221 -p tcp -j DROP
#iptables -A OUTPUT -o 192.168.21.221 -p tcp -j DROP
#iptables -A OUTPUT -s 192.168.21.221 -p tcp -j DROP
#iptables -A INPUT -s 192.168.21.221 -p tcp -j DROP
#iptables -A INPUT -p tcp -s 192.168.21.221 -j DROP
#iptables -A INPUT -p udp -s 192.168.21.221 -j DROP
#iptables -A INPUT -i eth1 -s 192.168.21.221 -j DROP
#iptables -A INPUT -i eth0 -s 192.168.21.221 -j DROP
#iptables -A FORWARD -p tcp -i eth0 -s 192.168.21.221 -j DROP
#iptables -A FORWARD -p udp -i eth0 -s 192.168.21.221 -j DROP
#iptables -t filter -I FORWARD -m mac --mac-source 00:e0:4c:45:22:8f -j DROP
#iptables -A FORWARD -p tcp -i eth1 -s 192.168.21.221 -j DROP
#iptables -A FORWARD -p udp -i eth1 -s 192.168.21.221 -j DROP
;;
	restart)
/etc/init.d/firewall.sh stop
/etc/init.d/firewall.sh start
;;
*)
	echo "Parametro informado, está errado!"
;;
esac

