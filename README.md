# QRBitcoinNode
QR code to connect bitcoin's node from wallet with QR reader, tested with Fully Noded: https://apps.apple.com/us/app/fully-noded/id1436425586

# Usage
Specially design for Ubuntu and linux in general, actually only it's tested in Ubuntu 20.04 LTS

File must be permission of execute: 

$ chmod +x qrbitcoinnode.sh

Execute script:

$ ./qrbitcoinnode.sh <NAME_HIDDEN_SERVICE_DIR> <NUM_PORT_HIDDEN_SERVICE> [LABEL]


NAME_HIDDEN_SERVICE_DIR --> Name of directory hiiden service bitcoin >>> /var/lib/tor/<NAME_HIDDEN_SERVICE_DIR>/

NUM_PORT_HIDDEN_SERVICE --> Number of port hidden service bitcoin, in file /etc/tor/torrc

LABEL                   --> ***OPTIONAL*** Name of label you want to put it

# Example
$ ./qrbitcoinnode.sh bitcoin_service 8333 Albit_Node

Enjoy it!
