#!/bin/bash

source ~/dlscripts/dl_func.sh

(
	cd ~/pic/Daily

	start="2023-03-15"
	end="2023-03-31"

	start=`date -d "$start"`
	end=`date -d "$end"`

	while ((`date -d "$start" +%s` <= `date -d "$end" +%s`)); do
		echo "$start"
		daily_dl "$start" PM25
		daily_dl "$start" TSP
		daily_dl "$start" TVOC
		daily_dl "$start" O3
		daily_dl "$start" CO
		daily_dl "$start" NO2
		start=`date -d "$start +1 day"`
	done
)
