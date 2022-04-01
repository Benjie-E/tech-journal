# Setup Configs for virtual machines
## Network devices
- Go to `Edit` > `Virtual Network Editor`
- Add additional host only networks for testing with 10.0.*.0/24 and DHCP disabled
## Kali
- Create new virtual machine
- Add kali ISO
- Follow default options and create a user account
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
- poweroff and create snapshot and clone
### Configure eth
- `Configure`
- `set interfaces ethernet eth*` `description`/`address`
- `set protocols static route 0.0.0.0./24 next-hop` NAT gateway(192.168.229.2)
- commit and save
