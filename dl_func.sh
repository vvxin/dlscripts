#!/bin/bash


# SENSOR NETWORK HOUR INTERPOLATION
# Sample URL.  Availble since 2022 Oct.
# http://101.201.76.168:8000/picture/pollutant/1/1/hourly/202212/PM25_2022120109.png
# Time point that ready to download: 48 min every hour


hourly_dl() {	
	url=http://101.201.76.168:8000/picture/pollutant/1/1/hourly/`date -d "$1" +%Y%m`/$2_`date -d "$1" +%Y%m%d%H`.png
	if ! test -f "./$2/`date -d "$1" +%Y%m`/$2_`date -d "$1" +%Y%m%d%H`.png"
	then
		wget -timeout=30 -P ./$2/`date -d "$1" +%Y%m` $url 
	fi	
}

# SENSOR NETWORK DAY AVERAGE INTERPOLATION
# Sample URL.  Availble since 2022.
# http://101.201.76.168:8000/picture/pollutant/1/1/daily/O3_20220122.png

daily_dl() {
	url=http://101.201.76.168:8000/picture/pollutant/1/1/daily/$2_`date -d "$1" +%Y%m%d`.png
	if ! test -f "./$2/`date -d "$1" +%Y`/$2_`date -d "$1" +%Y%m%d`.png"
	then
		wget -timeout=30 -P ./$2/`date -d "$1" +%Y` $url
	fi
}
