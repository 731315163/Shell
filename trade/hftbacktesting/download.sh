#!/bin/bash

#spot
nohup ./collect-data "/home/orderdata/binancespot" binance btcusdt &



#无法使用
nohup ./collect-data "/home/orderdata/binancefuturescm" binancefuturescm btcusdt &


nohup ./collect-data "/home/orderdata/binancefutures" binancefutures btcusdt &