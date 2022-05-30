# ref : https://forums.linuxmint.com/viewtopic.php?t=125166

MAC=00:1F:20:76:92:DA
# to set the mac address, put the device on discovery and use the command
# hcitool scan

DEV=hci0
# to get the correct device, use the command: sudo hcidump -at

echo "Be ready to enter the passkey ..."
sudo bluez-simple-agent hci0 00:1F:20:76:92:DA

sudo bluez-test-device trusted 00:1F:20:76:92:DA yes
sudo bluez-test-input connect 00:1F:20:76:92:DA

