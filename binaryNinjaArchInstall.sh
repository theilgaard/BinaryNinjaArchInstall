#!/bin/bash
#
# BinaryNinja 
# Install script on Arch Linux

INSTALL_LOCATION="/opt/"
BN_LAUNCH_LOCATION="/usr/local/bin/binaryninja"

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ -z "$1" ]; then 
    echo "Usage: sudo $0 <path-to-binaryninja.zip>" 
    exit
fi
BN_DL_PATH=$1

echo "[+] Extracting and placing BinaryNinja in /opt/binaryninja/ ..."
unzip -d $INSTALL_LOCATION $BN_DL_PATH

echo "[+] Linking libpython2.7 for plugin support..."
ln -s /usr/lib/libpython2.7.so.1.0 /usr/lib/libpython2.7.so.1

echo "[+] Creating launch script..."
rm -f $BN_LAUNCH_LOCATION
touch $BN_LAUNCH_LOCATION
chmod +x $BN_LAUNCH_LOCATION
echo "#!/bin/bash" > $BN_LAUNCH_LOCATION
echo "LD_PRELOAD=/usr/lib/libcurl.so.3 /opt/binaryninja/binaryninja" > $BN_LAUNCH_LOCATION

if [ -f $BN_LAUNCH_LOCATION ]; then
    echo "[+] Success! "
    echo "    Run with binaryninja" 
else
    echo "[!] Something went wrong..."
fi
