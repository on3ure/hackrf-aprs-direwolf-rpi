# HackRF Dire Wolf APRS Raspberry PI Zero #

### Why ###
To minimalize antennas and radios ... i'm using a Transverter on my Flex radio to use the 2M band [TR 144 - PRO, Khune](https://shop.kuhne-electronic.com/kuhne/en/shop/converter-transverte/transverter/TR+144++PRO++Transverter/?card=1621)
This transverter has seperate RX out ... witch is connected to a [AntennaJet AAS300DP](https://www.bonito.net/hamradio/en/bonito-antennajet-aas300-antenna-splitter-for-9khz-300mhz/),
one of these outputs is connected to a [HackRF](https://greatscottgadgets.com/hackrf/) that was laying arround.

### Install on Linux - Raspberry PI Zero ... Buster Release (2020) ###

## Install SoapySDR ##
	cd ~
	git clone https://www.github.com/wb2osz/direwolf
	cd direwolf
	make
	sudo make install
	make install-conf
