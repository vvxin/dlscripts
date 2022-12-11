#!/bin/bash

source ~/dlscripts/dl_func.sh

(
	cd ~/pic/Hourly
	hourly_dl "$(date)" PM25
	hourly_dl "$(date)" TSP
	hourly_dl "$(date)" TVOC
#	hourly_dl "$(date)" O3
#	hourly_dl "$(date)" CO
#	hourly_dl "$(date)" NO2
)

