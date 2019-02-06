#!/bin/bash
echo "#############################################"
echo "#######       Genkey festlegen        #######"
echo "#############################################"
read -p "Masternodegenkey eingeben:" Genkey
ServerIP=$(hostname  -I)
RPCUSER=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
RPCPASSWORD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w22 | head -n1)
echo "#############################################"
echo Hallo:   $USER
echo IP ist:  $ServerIP
echo MN Key:  $Genkey
echo "#############################################"
echo "#####Ok? warte 15s oder Strg-c wenn falsch###"
echo "#############################################"
sleep 15s
#
echo "#############################################"
echo "#######       setup firewall          #######"
echo "#############################################"
# --> hier P2P-Port anpassen
sudo ufw allow 5662/tcp
sudo ufw logging on
sudo ufw enable
echo "#############################################"
echo "#######       setup 1AP-Config        #######"
echo "#############################################"
# --> hier Pfad, Addnodes und Namen der Conf-Datei anpassen
mkdir ~/.apholding
touch ~/.apholding/apholding.conf
chown -R $USER .apholding
echo 'rpcuser='$RPCUSER |tee -a  ~/.apholding/apholding.conf
echo 'rpcpassword'=$RPCPASSWORD |tee -a  ~/.apholding/apholding.conf
echo 'daemon=1
server=1
rpcallowip=127.0.0.1
testnet=0
daemon=1
listen=1
masternode=1' |tee -a  ~/.apholding/apholding.conf
echo 'externalip='$ServerIP |tee -a ~/.apholding/apholding.conf
echo 'masternodeprivkey='$Genkey |tee -a  ~/.apholding/apholding.conf
echo '#addnode=45.32.185.152' |tee -a  ~/.apholding/apholding.conf
echo '#addnode=45.76.130.135' |tee -a  ~/.apholding/apholding.conf
echo "#############################################"
echo "#######       setup 1AP-Daemon        #######"
echo "#############################################"
mkdir ~/apholding
cd ~/apholding
# --> hier Download und Dateinamen anpassen
wget https://github.com/1apdeveloper/mn-setup/raw/master/apholding-cli
wget https://github.com/1apdeveloper/mn-setup/raw/master/apholding-tx
wget https://github.com/1apdeveloper/mn-setup/raw/master/apholdingd
chmod +x *
./apholdingd &
sleep 10
./apholding-cli getinfo
echo "#############################################"
echo "#######            DONE !             #######"
echo "#############################################"
