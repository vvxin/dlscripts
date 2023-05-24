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
