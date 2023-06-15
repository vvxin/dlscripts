#!/bin/bash
#crontab:
#32,42 * * * * ~/dlscripts/sensor_hour.sh >/dev/null 2>&1


source ~/dlscripts/dl_func.sh

(
	cd ~/pic/Hourly
	hourly_dl "$(date --date="1 hour ago")" PM25
	hourly_dl "$(date --date="1 hour ago")" TSP
	hourly_dl "$(date --date="1 hour ago")" TVOC
	hourly_dl "$(date --date="1 hour ago")" O3
#	hourly_dl "$(date --date="1 hour ago")" CO
#	hourly_dl "$(date --date="1 hour ago")" NO2
)

