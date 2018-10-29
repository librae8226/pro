#!/bin/bash

#
# $1: code
#

mkdir -p data/$1
str=$1
if [ ${str:0:1} = "6" ]; then
	ts_code="$1.SH"
else
	ts_code="$1.SZ"
fi

generate_post_data()
{
cat << EOF
  {
     "api_name": "$1",
     "token": "ddd6e0c87f1135241e6d946a0efbf9d78d0e5811cbfc78134bfa4c96",
     "params": {
       "ts_code": "$ts_code"
    }
  }
EOF
}

curl -X POST -d "$(generate_post_data income)" http://api.tushare.pro > data/$1/income.json
curl -X POST -d "$(generate_post_data balancesheet)" http://api.tushare.pro > data/$1/balancesheet.json
curl -X POST -d "$(generate_post_data cashflow)" http://api.tushare.pro > data/$1/cashflow.json


#curl -X POST -d '{"api_name": "income", "token": "ddd6e0c87f1135241e6d946a0efbf9d78d0e5811cbfc78134bfa4c96", "params": {"ts_code":"600563.SH"}}' http://api.tushare.pro > 600563.sh.income.json
