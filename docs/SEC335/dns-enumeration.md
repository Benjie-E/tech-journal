# DNS
## Get servers
`
sudo nmap 10.0.5.0/24 -p 53 --open -oG -
`
- [Scan for ports](docs\SEC335\portscanner2.sh)

## Resolve IPs
### PowerShell:
docs\SEC335\dns-resolver.ps1
### Bash:
docs\SEC335\dns-resolver.sh
### Nmap:
`
sudo nmap 10.0.5.0/24 -sL --dns-servers 10.0.5.22 | grep "("|grep "report"|cut -d " " -f 5-
`
