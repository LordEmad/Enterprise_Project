#!/bin/bash

# Root check
if [[ $UID -ne 0 ]]; then
    echo "ERROR: Please run as root"
    exit 1
fi

# Define VLANs and IPs in arrays
VLANS=(10 20 30)
IPS=("192.168.10.1/24" "192.168.20.1/24" "192.168.30.1/24")
BASE_INTERFACE="ens160"

# Check if base interface exists
if ! nmcli device show $BASE_INTERFACE &>/dev/null; then
   
       	echo "ERROR: Interface $BASE_INTERFACE not found!"
        exit 1
fi

# Loop through VLANs and create each one
for i in "${!VLANS[@]}"                                                     #   ! for indexes
do
    
	VLAN_ID=${VLANS[$i]}

    	IP=${IPS[$i]}
   
       	CON_NAME="vlan$VLAN_ID"

    # Check if VLAN already exists
    if nmcli connection show $CON_NAME &>/dev/null; then
       
	    echo "$CON_NAME already exists — skipping"
            continue
    fi

    # Create VLAN using nmcli
    nmcli connection add  type vlan  con-name $CON_NAME dev $BASE_INTERFACE id  $VLAN_ID  ipv4.addresses $IP ipv4.method manual
    echo "Created: $CON_NAME (VLAN $VLAN_ID)"

    # Bring up the connection
    nmcli connection up $CON_NAME
    echo "$CON_NAME : UP"

    echo "---"
done

# Confirm at the end
echo "===== VLAN Connections ====="
nmcli connection show

echo "===== VLAN Interfaces ====="
nmcli device show
