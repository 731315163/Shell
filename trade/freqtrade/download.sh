#!/bin/bash
 
nohup freqtrade download-data --timerange 20200101-  --pairs-file ./user_data/pairs.json --timeframes 1m 5m 15m 1h 1d &