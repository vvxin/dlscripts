#!/bin/bash
#crontab:   
#28 * * * * ~/dlscripts/predict36_map.sh "$(date --date="-1 hour")" >/dev/null 2>&1

source ~/dlscripts/dl_func.sh

(
	cd ~/pic/Hourly/PM25forecast/

    start=`date --date "$1 +1 hour"`
    end=`date --date "$1 +36 hour"`

    while ((`date -d "$start" +%s` <= `date -d "$end" +%s`)); do
        pred_pic_dl "$start" "$1"
		start=`date -d "$start +1 hour"`
	done

)

