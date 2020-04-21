# HackRF Dire Wolf APRS Raspberry PI Zero #

### Why ###
To minimalize antennas and radios ... i'm using a Transverter on my Flex radio to use the 2M band, a use a [TR 144 - PRO, Khune](https://shop.kuhne-electronic.com/kuhne/en/shop/converter-transverte/transverter/TR+144++PRO++Transverter/?card=1621)

This transverter has seperate RX out ... witch is connected to a [AntennaJet AAS300DP](https://www.bonito.net/hamradio/en/bonito-antennajet-aas300-antenna-splitter-for-9khz-300mhz/), 
one of these outputs is connected to a [HackRF](https://greatscottgadgets.com/hackrf/) SDR board that was laying arround.
The SDR Board is connect to a usb/ethernet dongle for the Raspberry PI Zero.

### Install on Linux - Raspberry PI Zero ... Buster Release (2020) ###

## Install Dependancies ##
```console
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install libasound2-dev libhackrf-dev libhackrf0 hackrf cmake swig git conspy
```

## Install SoapySDR ##
```console
cd ~
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build
cd build
cmake ..
make 
sudo make install
sudo ldconfig
SoapySDRUtil --info
```

## Install SoapyHackRF ##
```console
cd ~
git clone https://github.com/pothosware/SoapyHackRF.git
cd SoapyHackRF
mkdir build
cd build
cmake ..
make
sudo make install
sudo SoapySDRUtil --probe="driver=hackrf"
```

## Install rx_tools ##
```console
cd ~
git clone https://github.com/rxseger/rx_tools.git
cd rx_tools
mkdir build
cd build
cmake ..
make
sudo make install
```

## Install Dire Wolf ##
```console
cd ~
git clone https://www.github.com/wb2osz/direwolf
cd direwolf
make
sudo make install
```

## Install start scripts ##
```console
cd ~
git clone https://github.com/on3ure/hackrf-aprs-direwolf-rpi-zero.git
cd hackrf-aprs-direwolf-rpi-zero
sudo mkdir -p /aprs
sudo cp sdr-1200bps.conf /aprs
sudo cp aprs.sh /aprs
sudo cp aprs.service /lib/systemd/system/

sudo systemctl --system daemon-reload

sudo systemctl enable aprs
sudo systemctl start aprs
```

## Disable bluetooth and wifi ##
```console
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo reboot
```

## Console ##
You can monitor the aprs console via
```console
conspy 3
```
Press 3 times ESC to exit

## Notes ##
No transverter ... change the 28.800 frequency to 144.800 (or whatever your local aprs frequency is) in aprs.sh

## Colors ##
If you want different colors ... there is a patch in the repository [direwolf-dev-color.patch](https://github.com/on3ure/hackrf-aprs-direwolf-rpi-zero/blob/master/direwolf-dev-color.patch) !
This patch is against the development tree of Dire Wolf.
