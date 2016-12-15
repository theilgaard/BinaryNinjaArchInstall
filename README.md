# BinaryNinjaArchInstall
Tiny install script for Binary Ninja on Arch Linux

### Requirements
BN requires `/usr/lib/libpython2.7.so.1.0` and `/usr/lib/libcurl.so.3`, so make sure you have the files.


### Instructions

Download, chmod +x and run binaryNinjaArchInstall.sh

```
wget https://github.com/theilgaard/BinaryNinjaArchInstall/blob/master/binaryNinjaArchInstall.sh
chmod +x binaryNinjaArchInstall.sh
```

Now run the install script with the BinaryNinja .zip as the only argument
```
./binaryNinjaArchInstall.sh <path-to-binaryninja.zip>
```
