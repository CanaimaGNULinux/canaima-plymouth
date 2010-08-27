#!/bin/bash
if [ ! -e /usr/share/plymouth/themes/canaima-plymouth ]
then
    sudo mkdir /usr/share/plymouth/themes/canaima-plymouth
fi

sudo cp * /usr/share/plymouth/themes/canaima-plymouth/
sudo plymouth-set-default-theme canaima-plymouth
sudo plymouthd --debug --debug-file=/tmp/plymouth-debug-out 
sudo plymouth --show-splash 
for I in {0..10}
do 
	sleep 5 
	plymouth --update=event$I 
done 
plymouth --quit

