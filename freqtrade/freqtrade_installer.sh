#!/bin/bash
# install talib c package
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar zxvf ta-lib-0.4.0-src.tar.gz
cd ta-lib
./configure --prefix=/usr
make
make install
# install talib python package
pip install TA-Lib
#pip install freqtrade
