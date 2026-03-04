#!/bin/bash

if [[ $UID -ne 0 ]]; then
    echo "You must be root user"
    exit 1
fi

if systemctl is-active dhcpd &>/dev/null; then
    echo "DHCP : Running"
else
    echo "DHCP : Not running — attempting to start..."
    systemctl start dhcpd
fi

echo "-----------------------------##--------------------------"


grep "^lease" /var/lib/dhcpd/dhcpd.leases | wc -l


echo "--------------------------##-----------------------------"


awk '
/^lease/              { ip = $2 }
/hardware ethernet/   { mac = $3 }
/client-hostname/     { hostname = $2 }
/ends/                { ends = $3" "$4 }
/^  binding state/    { state = $3 }
/^}/                  { if (state == "active;") print ip, mac, hostname, ends }
' /var/lib/dhcpd/dhcpd.leases



