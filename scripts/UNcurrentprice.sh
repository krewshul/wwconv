#!/bin/bash

curl -X GET --output UNcurrent.json https://api.unnamed.exchange/v1/Public/OrderBook?market=WW_BTC&depth=1
sleep 2
python -m json.tool UNcurrent.json > UNPcurrent.json
sleep 1
sed -i -r 's/[pric ":]//g' UNPcurrent.json
awk NR==5 UNPcurrent.json > UNUcurrent
awk '{print substr($0,2,18)}' UNUcurrent > UNUcurrentsell
cat UNUcurrentsell | awk '{printf("%0.8f",$0);}' > UNcurrentsell
