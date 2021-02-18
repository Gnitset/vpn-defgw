To use with nordvpn:
1. Create vlan 8 in you switches/accesspoints/whatever
1. Create the subnet for the clients and attach it to vlan 8 `docker network create -d macvlan --subnet=10.11.8.0/24 --ip-range=10.11.8.0/28 -o parent=eth0.8 vpnvlan`
1. Go to https://nordvpn.com/servers/tools/ and pick a server that supports openvpn
1. Download the config for OpenVPN UDP and save it as config.ovpn
1. Edit the downloaded config and replace the line `auth-user-pass` with `auth-user-pass /cred`
1. Put you username and password in a file called cred, username on the first line and password on the second
1. Build the container with `docker build -t vpn-defgw .`
1. Run the container with `docker run -dit --cap-add=NET_ADMIN --name vpn-defgw vpn-defgw`
1. Attach vlan 8 to the container `docker network connect vpnvlan vpn-defgw`

To change vlan, change eth0.8 to eth0.<vlan_id> in the command above

To change ip-network you have to replace it in the command above and in the files run and udhcpd.conf

To use with different vpn provider:
1. Make sure the provider supports openvpn
1. Replace dns-servers in udhcpd.conf
1. Do rest of the steps from nordvpn
