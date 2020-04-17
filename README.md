# HackRF Dire Wolf APRS Raspberry PI Zero #

### Why ###
To minimalize antennas and radios ... i'm using a Transverter on my Flex radio to use the 2M band [TR 144 - PRO, Khune](https://shop.kuhne-electronic.com/kuhne/en/shop/converter-transverte/transverter/TR+144++PRO++Transverter/?card=1621)
This transverter has seperate RX out ... witch is connected to a [AntennaJet AAS300DP](https://www.bonito.net/hamradio/en/bonito-antennajet-aas300-antenna-splitter-for-9khz-300mhz/),
one of these outputs is connected to a [HackRF](https://greatscottgadgets.com/hackrf/) that was laying arround.

### Install on Linux - Raspberry PI Zero ... Buster Release (2020) ###

## Install Dependancies ##
```console
  sudo apt -y update
  sudo apt -y upgrade
  sudo apt -y install libasound2-dev libhackrf-dev libhackrf0 hackrf cmake swig git
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
  sudo mkdir -p /aprs
  sudo cp sdr-1200bps.conf /aprs
  sudo cp aprs.sh /aprs
```

## Disable bluetooth and wifi ##
```console
  echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
  echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
  sudo systemctl disable hciuart
  reboot
```

## Notes

You can monitor the console via

Edit aprs.sh .... i use a transverter ... so 28.800 is the transverted frequencie for 144.800, is you want
to do this directly on a 2m receive antenna ... change this !
