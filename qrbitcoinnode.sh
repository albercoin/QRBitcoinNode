#!/bin/bash
#Dependencies: qrencode
#Usage: ./qrbitcoinnode.sh NAME_HIDDEN_SERVICE_DIR NUM_PORT_HIDDEN_SERVICE LABEL


#Check number of parameters
if [ $# -lt 2 ] || [ $# -gt 3 ]; 
then
	echo "usage: ./qrbitcoinnode.sh <NAME_HIDDEN_SERVICE_DIR> <NUM_PORT_HIDDEN_SERVICE> [<LABEL>] "
	echo ""
	echo "<NAME_HIDDEN_SERVICE_DIR> --> /var/lib/tor/<NAME_HIDDEN_SERVICE_DIR>  Name of directory hiiden service bitcoin"
	echo "<NUM_PORT_HIDDEN_SERVICE> --> /etc/tor/torrc   >>> Number of port hidden service bitcoin"
	echo "<LABEL>                   --> ***OPTIONAL*** Name of label you want to put it"
	echo ""
	exit 1
fi


#Check if qrencode is installed
QRENCODE=/usr/bin/qrencode
if ! test -f "$QRENCODE"; 
then
	echo "qrencode not installed; installing now..."
	sudo apt install qrencode -y
fi


hidden_service_dir=$1
port_onion=$2

rpcuser=$(cat $HOME/.bitcoin/bitcoin.conf | grep "rpcuser")
user=${#rpcuser}
rpcuser=${rpcuser:8:$user}
rpcpass=$(cat $HOME/.bitcoin/bitcoin.conf | grep "rpcpass")
pass=${#rpcpass}
rpcpass=${rpcpass:12:$pass}
echo "To access hidden service directories, root privileges required"
onion=$(sudo cat /var/lib/tor/$hidden_service_dir/hostname)

if [ $# -eq 3 ];
then
	label=$3
	URL="btcstandup://$rpcuser:$rpcpass@$onion:$port_onion?label=$label"
else
	URL="btcstandup://$rpcuser:$rpcpass@$onion:$port_onion?" 
fi 

echo "QR Code text: $URL"

# Delete file if exist
rm qrbtcnode.png 2> /dev/null

# Create QR file
qrencode -o qrbtcnode.png -s 9 $URL

# Open file if exist visor
IMG_VISOR=/usr/bin/eog
if test -f "$IMG_VISOR";
then
	eog qrbtcnode.png &
else
	echo "File created successfully... qrbtcnode.png"
fi
