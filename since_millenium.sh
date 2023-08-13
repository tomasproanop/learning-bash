#! /usr/bin/env bash

millennium="Years since the millennium:"
todays_date=$( date '+%F' )
year=$( date '+%Y' )
echo "Today's date:" $todays_date
years_since_2000=$(( year - 2000 ))
echo $millennium $years_since_2000