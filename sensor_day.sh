#!/bin/bash
#crontab:
#30 2,5,8 * * * ~/dlscripts/sensor_day.sh >/dev/null 2>&1

source ~/dlscripts/dl_func.sh

(
	cd ~/pic/Daily
	daily_dl "$(date --date="yesterday")" PM25
	daily_dl "$(date --date="yesterday")" TSP
	daily_dl "$(date --date="yesterday")" TVOC
	daily_dl "$(date --date="yesterday")" O3
	daily_dl "$(date --date="yesterday")" CO
	daily_dl "$(date --date="yesterday")" NO2
)

