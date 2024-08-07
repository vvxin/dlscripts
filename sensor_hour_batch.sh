#!/bin/bash

source ~/dlscripts/dl_func.sh

(
	cd ~/pic/Hourly

	start="2023-10-10 11:00"
	end="2023-10-11 10:00"

	start=`date -d "$start"`
	end=`date -d "$end"`

	while ((`date -d "$start" +%s` <= `date -d "$end" +%s`)); do
		echo "$start"
		hourly_dl "$start" PM25
		hourly_dl "$start" TSP
		hourly_dl "$start" TVOC
		hourly_dl "$start" O3
#		hourly_dl "$start" CO
#		hourly_dl "$start" NO2
		start=`date -d "$start +1 hour"`
	done
)

