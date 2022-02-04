param($network,$server)
for($i=1;$i -lt 255;$i++)
{
Resolve-DnsName -DnsOnly $network'.'$i -Server $server -ErrorAction Ignore | Select-Object -Property Name,NameHost
}