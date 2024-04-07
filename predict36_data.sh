#!/bin/bash
#crontab:   
#3 * * * * ~/dlscripts/predict36_data.sh >/dev/null 2>&1


source ~/dlscripts/dl_func.sh

(
	cd ~/predict_data/
    pred_dat_dl "$(date --date="1 hour ago")"
    pred_dat_dl_2 "$(date --date="1 hour ago")"
)

