#!/bin/bash


# SENSOR NETWORK HOUR INTERPOLATION
# Sample URL.  Availble since 2022 Oct.
# http://101.201.76.168:8000/picture/pollutant/1/1/hourly/202212/PM25_2022120109.png
# Time point that ready to download: 48 min every hour
# URL changed since 2023-05-15
# https://f.hotgrid.cn/picture-service/pollutant/1/1/hourly/202305/PM25_2023052409.png
# !!! Time point that ready to download: 1 and a half hour later,  no pic for the current hour

hourly_dl() {	
	url=https://f.hotgrid.cn/picture-service/pollutant/1/1/hourly/`date -d "$1" +%Y%m`/$2_`date -d "$1" +%Y%m%d%H`.png
	if ! test -f "./$2/`date -d "$1" +%Y%m`/$2_`date -d "$1" +%Y%m%d%H`.png"
	then
		wget -timeout=30 -P ./$2/`date -d "$1" +%Y%m` $url 
	fi
}

hourly_dl_old() {	
	url=http://101.201.76.168:8000/picture/pollutant/1/1/hourly/`date -d "$1" +%Y%m`/$2_`date -d "$1" +%Y%m%d%H`.png
	if ! test -f "./$2/`date -d "$1" +%Y%m`/$2_`date -d "$1" +%Y%m%d%H`.png"
	then
		wget -timeout=30 -P ./$2/`date -d "$1" +%Y%m` $url 
	fi	
}

# SENSOR NETWORK DAY AVERAGE INTERPOLATION
# Sample URL.  Availble since 2022.
# http://101.201.76.168:8000/picture/pollutant/1/1/daily/O3_20220122.png
# URL changed since 2023-03-14
# https://f.hotgrid.cn/picture-service/pollutant/1/1/daily/PM25_20230330.png


daily_dl() {
	url=https://f.hotgrid.cn/picture-service/pollutant/1/1/daily/$2_`date -d "$1" +%Y%m%d`.png
	if ! test -f "./$2/`date -d "$1" +%Y`/$2_`date -d "$1" +%Y%m%d`.png"
	then
		wget -timeout=30 -P ./$2/`date -d "$1" +%Y` $url
	fi
}

daily_dl_old() {
	url=http://101.201.76.168:8000/picture/pollutant/1/1/daily/$2_`date -d "$1" +%Y%m%d`.png
	if ! test -f "./$2/`date -d "$1" +%Y`/$2_`date -d "$1" +%Y%m%d`.png"
	then
		wget -timeout=30 -P ./$2/`date -d "$1" +%Y` $url
	fi
}


# 36 HOURS FORECAST 'CONTOUR MAP' BASED ON SENSOR DATA
# Sample URL.  Available since 2023-09-29 (to the end of 2023) 
# https://f.hotgrid.cn/bjmemc-prediction-picture/predict_qc_2023-09-30_04cur_2023-09-29_00.png
# Pics ready 1 hour and 25 minutes later than "current" hour
#
# URL changed since 2024 Feb
# https://f.i2value.cn/bjmemc-prediction-picture/predict_qc_2024-02-06_11cur_2024-02-05_11.png

pred_pic_dl() {	
	url=https://f.i2value.cn/bjmemc-prediction-picture/predict_qc_`date -d "$1" +%Y-%m-%d_%H`cur_`date -d "$2" +%Y-%m-%d_%H`.png
	if ! test -f "./`date -d "$2" +%Y%m`/`date -d "$2" +%m%d_%H`/predict_qc_`date -d "$1" +%Y-%m-%d_%H`cur_`date -d "$2" +%Y-%m-%d_%H`.png"
	then
		wget -timeout=30 -P ./`date -d "$2" +%Y%m`/`date -d "$2" +%m%d_%H` $url
	fi
}

# 36 HOURS FORECAST 'EXCEL DATA' BASED ON SENSOR DATA
# Sample URL.  Available since 2023-09-29  (to the end of 2023) 
# https://f.hotgrid.cn/bjmemc-prediction-picture/2023-10-09-11.xlsx
# Data file ready 1 hour and 1 minutes later than "current" hour
#
# URL changed since 2024 Feb
# https://f.i2value.cn/bjmemc-prediction-picture/2024-02-05-11.xlsx

pred_dat_dl() {	
	url=https://f.i2value.cn/bjmemc-prediction-picture/`date -d "$1" +%Y-%m-%d-%H`.xlsx
	if ! test -f "./`date -d "$1" +%Y-%m-%d-%H`.xlsx"
	then
		wget -timeout=30 -P . $url 
	fi	
}

# Add result of the 2nd model with identical data format
# since 2024-3-30-17
# https://f.hotgrid.cn/bjmemc-prediction-picture/2024-03-30-17_2.xlsx

pred_dat_dl_2() {	
	url=https://f.i2value.cn/bjmemc-prediction-picture/`date -d "$1" +%Y-%m-%d-%H`_2.xlsx
	if ! test -f "./`date -d "$1" +%Y-%m-%d-%H`_2.xlsx"
	then
		wget -timeout=30 -P . $url 
	fi	
}