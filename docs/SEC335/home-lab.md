# Setup Configs for virtual machines
## Network devices
- Go to `Edit` > `Virtual Network Editor`
- Add additional host only networks for testing with 10.0.*.0/24 and DHCP disabled
## Kali
- Create new virtual machine
- Add kali ISO
- Follow default options and create a user account
- poweroff, create snapshot and clone
## vyos
- 8GB
- 1GB RAM
- add ISO for vyos
- Add additional Network adapter for Network 5
- follow default setup and add password for vyos user
- reboot
### Remove MAC addresses
- `Configure`
- `show interfaces`
- delete hw-id if exists
- `commit` and `save`
- poweroff, create snapshot and clone
### Configure eth
- `Configure`
- `set interfaces ethernet eth*` `description`/`address`
- `set protocols static route 0.0.0.0./24 next-hop` NAT gateway(192.168.229.2)
- commit and save
## centos
- Create new virtual machine
- ISO later
- using vmnet5 instead of NAT
- Add Centos ISO after config up
### Setup
- Skip tests
- OK
- name to centos
- Use all Space
- Install as Web Server
- `Development` > `Development tools` and `Server Platform Development`
- add and create new user `deployer`
- `usermod -aG wheel deployer`
- uncomment wheel line from /etc/sudoers
### network stuff
- remove MAC and UUID from /etc/sysconfig/network-scripts/ifcfg-_interface_
### VMWare Tools
- Click on install VMware tools from menu bar
- `mount /dev/cdrom /mnt`
- `cp VMWareTools*.tar.gz /tmp`
- `tar xf VMwareTools*.tar.gz`
- `chmod +x vmw`
- `./vmware-install.pl`
- Choose which configs you want
### Clone
- poweroff, create snapshot and clone
## vyos 2
- `configure`
- `set service ssh listen-address`
- commit and save
### DCHP
`configure `
`set service dhcp-server global-parameters 'local-address 10.0.5.2;'`
`set service dhcp-server shared-network-name DHCPPOOL authoritative`
`set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 default-router '10.0.5.2'`
`set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 domain-name 'range.local'`
`set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 lease '86400'`
`set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 range POOL1 start '10.0.5.50'`
`set service dhcp-server shared-network-name DHCPPOOL subnet 10.0.5.0/24 range POOL1 stop '10.0.5.100'`
`commit`
`save`
## VPN
### kali
#### Wireguard keypair
- `cd /etc/wireguard`
- `umask 077`
- `wg genkey | tee privatekey | wg pubkey > publickey`
### vyos
#### Wireguard keypair
- `generate pki wireguard key-pair`
- `configure`
- `set interfaces wireguard wg0 private-key KEY-FROM-GENERATE`
#### Create Peer
- `set interfaces wireguard wg0 address '10.0.99.1/24'`
- `set interfaces wireguard wg0 peer namegoeshere allowed-ips '10.0.99.100/32'`
- `set interfaces wireguard wg0 peer namegoeshere public-key PUB-KEY FROM KALI`
- `set interfaces wireguard wg0 port '51820'`
- `commit`
- `save`
- `exit`
### kali
- Create wireguare config file in /etc/wireguard/wg0.conf
- `[Interface]
PrivateKey = Kali-Private-Key
Address = 10.0.99.100/24
[Peer]
PublicKey = Vyos-Public-Key
EndPoint = 192.168.229.10:51820
AllowedIPs = 10.0.99.1/32, 10.0.5.0/24`
# Problems
## kali ssh key type incompatibility
- Create .conf file int /etc/ssh/ssh_config.d/
- `Host 10.0.5.*`\
`PubkeyAcceptedKeyTypes ssh-rsa`\
`HostKeyAlgorithms ssh-rsa`
## `generate wireguard default-keypair` deprecated
- use `generate pki wireguard key-pair` instead
