freqtrade create-userdir --userdir user_data
freqtrade new-config --config user_data/config.json
freqtrade download-data --dl-trades -c user_data/config.json --timerange 20230101- 
pip install -r requirements-hyperopt.txt
freqtrade hyperopt --timerange 20240906-20241101 --strategy Trend --space buy sell --epochs 10 --hyperopt-loss ProfitDrawDownHyperOptLoss --random-state 123 --timeframe-detail 1m --timeframe 5m