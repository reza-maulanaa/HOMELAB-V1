# 2026-07-02 12:53:00 by RouterOS 7.23.2
# software id = 1VJZ-7U0L
#
# model = RB941-2nD
# serial number = HJY0AT5301A
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface vlan
add interface=ether4 name=vlan1-wan vlan-id=1
add interface=ether4 name=vlan10-lan vlan-id=10
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=pool-lan ranges=192.168.10.10-192.168.10.100
/ip dhcp-server
add address-pool=pool-lan interface=vlan10-lan lease-time=1d name=dhcp-lan
/ip address
add address=192.168.10.1/24 interface=vlan10-lan network=192.168.10.0
/ip dhcp-client
add interface=vlan1-wan name=client1 use-peer-dns=no
/ip dhcp-server network
add address=192.168.10.0/24 dns-server=8.8.8.8,1.1.1.1 gateway=192.168.10.1
/ip dns
set allow-remote-requests=yes
/ip firewall filter
add action=accept chain=input connection-state=established,related
add action=drop chain=input connection-state=invalid
add action=drop chain=input comment="block akses masuk dari WAN" \
    in-interface=vlan1-wan
add action=accept chain=forward connection-state=established,related
add action=drop chain=forward connection-state=invalid
/ip firewall nat
add action=masquerade chain=srcnat out-interface=vlan1-wan
