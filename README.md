### Setup a Masternode

in wallet: Open Debug console: 

masternode genkey

<table>
<tr><td>example</td></tr>
<tr><td>6ehsxiEwmLzeT4EaCuX9v2euuYQNGSjjBKxRUTrmbdXG</td></tr>
</table>

getaccountaddress "MN1" 

<table>
<tr><td>example</td></tr>
<tr><td>HRbcQmmJUUPJ9RKZfa1ariykE1z774156P</td></tr>
</table>

send exact 50000 Coins to the address (confirmation need: 15) 


### on VPS (f.e.: digital ocean, vultr...) Ubuntu 1604 !! on vultr(minimum 3.50$ per month)

sudo apt-get update

sudo apt-get upgrade

sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev libboost-program-options-dev

sudo apt-get install libminiupnpc-dev libzmq3-dev libprotobuf-dev protobuf-compiler unzip software-properties-common

sudo add-apt-repository ppa:bitcoin/bitcoin

sudo apt-get update

sudo apt-get install libdb4.8-dev libdb4.8++-dev

sudo apt-get install libdb4.8-dev libdb4.8++-dev

wget https://raw.githubusercontent.com/1apdeveloper/mn-script/master/aphsetup.sh && chmod +x aphsetup.sh && ./aphsetup.sh

to start the server : 
 
fillout masternode genkey

 
### in wallet
 
debug console

masternode outputs

<table>
<tr><td>example</td></tr>
 <tr><td>{</td></tr>
<tr><td>    "txhash": "c8ab8aa43d50cae6bf2b89b09f124bd83beaec00537884be8ec6585d1922", </td></tr>
<tr><td>     "outputidx": 1 {</td></tr>
<tr><td>   }</td></tr>
</table>


### Configure masternode.conf file (look at the example in file), reopen wallet and start masternode in debug console

<table>
<tr><td>example for masternode in masternode.conf file </td></tr>
<tr><td>mn1 IP_OF_THE_SERVER:5662 MASTERNODE_GENKEY TX_HASH TX_OUTPUTS</td></tr>
<tr><td>mn1 123.12.15.14:5662 6ehsxiEwmLzeT4EaCuX9v2euuYQNGSjjBKxRUTrmbdXG c8ab8aa43d50cae6bf2b89b09f124bd83beaec00537884be8bae6585d1922 1</td></tr>
</table>

save file, reopen wallet and start in debug console 

startmasternode alias false MN1

