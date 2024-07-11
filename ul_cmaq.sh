#!/bin/bash

filename="cmaq$(date +%Y%m%d).csv"

if ! test -f $filename
	then
		curl -X POST \
             -F "subsystem_code=bjmemc-prediction-picture" \
             -F "subsystem_api=https://f.i2value.cn/picture-service/pollutant/" \
             -F "files=@/home/wangxin/cmaq1h/$filename" \
             https://api-file-manage.airqualitychina.cn:9998/api/hold-filename-upload
fi

