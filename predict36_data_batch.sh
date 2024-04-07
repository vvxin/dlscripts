#!/bin/bash

source ~/dlscripts/dl_func.sh

(
	cd ~/predict_data/

	start="2024-03-30 17:00"
	end="2024-04-07 08:00"

	start=`date -d "$start"`
	end=`date -d "$end"`

	while ((`date -d "$start" +%s` <= `date -d "$end" +%s`)); do
		echo "$start"
        pred_dat_dl "$start"
		pred_dat_dl_2 "$start"
		start=`date -d "$start +1 hour"`
	done
)

