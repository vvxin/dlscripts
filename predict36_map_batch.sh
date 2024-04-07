#!/bin/bash

(
	start="2023-09-29 04:00"
	end="2023-10-11 08:00"

	start=`date -d "$start"`
	end=`date -d "$end"`

	while ((`date -d "$start" +%s` <= `date -d "$end" +%s`)); do
        ~/dlscripts/predict36_map.sh "$start"
		start=`date -d "$start +1 hour"`
	done
)

