# STEP BY STEP KONFIGURASI 1.0

# Ganti ip laptop

## Manual

IP Address : 10.90.90.2
Netmask    : 255.0.0.0
Gateway    : kosong
DNS        : kosong

# Masuk ke IP Switch

10.90.90.90

# Setting VLAN 

Port	VLAN 100 (WAN)	VLAN 10 (LAN)	PVID
Port 1 (ISP)	Untagged	—	100
Port 2 (device)	—	Untagged	10
Port 3 (device)	—	Untagged	10
Port 4 (device)	—	Untagged	10
Port 5 (Mikrotik)	Tagged	Tagged	1 (default, tidak dipakai)

# Setting IP Switch

IP: 192.168.99.2
Subnet Mask: 255.255.255.0
Gateway: 192.168.99.1

## pindah ke ether 2 mikrotik

# Setting Mikrotik

masuk ke winbox dan ke mac address

setting konfigurasi mikrotiknya secara bertahap 
semua konfigurasinya ada di configs/config-homelab-v1.rsc

## pindah ke ether 2/3/4 switch
## pindah ip laptop ke DHCP
## colok kabel ethernet isp ke ether 1 switch

# test ping

ping -c 4 8.8.8.8
ping -c 4 google.com

### JIKA BERHASIL ALHAMDULILLAH

# Cara akses Switch

Lan Laptop ke Port 1 Switch
Pake IP Statis
Masuk ke IP Switch

# Terima kasih