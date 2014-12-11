#!/bin/bash
DIR="/home/ubuntu/rrdtool/DHT22"

#set to C if using Celsius
TEMP_SCALE="C"
HUMIDITY_SCALE="%"
#define the desired colors for the graphs
INTEMP_COLOR="#888E23"
HUMIDITY_COLOR="#4193DB"

#hourly
rrdtool graph $DIR/DHT22_hourly.png --start -4h -w 500 -h 200 \
DEF:DHTtemp=$DIR/DHTtemp.rrd:DHTtemp:AVERAGE \
AREA:DHTtemp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=DHTtemp,MAXIMUM \
VDEF:min_temp=DHTtemp,MINIMUM \
VDEF:cur_temp=DHTtemp,LAST \
GPRINT:DHTtemp:LAST:"Cur\:%3.2lf%s" \
GPRINT:DHTtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:DHTtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:DHTtemp:AVERAGE:"Avg\:%3.2lf%s\n" \

rrdtool graph $DIR/humidity_hourly.png --start -4h -w 500 -h 200 \
DEF:DHThumidity=$DIR/DHThumidity.rrd:DHThumidity:AVERAGE \
AREA:DHThumidity$HUMIDITY_COLOR:"Paratartalom [deg $HUMIDITY_SCALE]" \
VDEF:max_hum=DHThumidity,MAXIMUM \
VDEF:min_hum=DHThumidity,MINIMUM \
VDEF:cur_hum=DHThumidity,LAST \
GPRINT:DHThumidity:LAST:"Cur\:%3.2lf%s" \
GPRINT:DHThumidity:MIN:"Min\:%3.2lf%s" \
GPRINT:DHThumidity:MAX:"Max\:%3.2lf%s" \
GPRINT:DHThumidity:AVERAGE:"Avg\:%3.2lf%s\n" \

#daily
rrdtool graph $DIR/DHT22_daily.png --start -1d -w 500 -h 200  \
DEF:DHTtemp=$DIR/DHTtemp.rrd:DHTtemp:AVERAGE \
AREA:DHTtemp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=DHTtemp,MAXIMUM \
VDEF:min_temp=DHTtemp,MINIMUM \
VDEF:cur_temp=DHTtemp,LAST \
GPRINT:DHTtemp:LAST:"Cur\:%3.2lf%s" \
GPRINT:DHTtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:DHTtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:DHTtemp:AVERAGE:"Avg\:%3.2lf%s\n" \

rrdtool graph $DIR/humidity_daily.png --start -1d -w 500 -h 200 \
DEF:DHThumidity=$DIR/DHThumidity.rrd:DHThumidity:AVERAGE \
AREA:DHThumidity$HUMIDITY_COLOR:"Paratartalom [deg $HUMIDITY_SCALE]" \
VDEF:max_hum=DHThumidity,MAXIMUM \
VDEF:min_hum=DHThumidity,MINIMUM \
VDEF:cur_hum=DHThumidity,LAST \
GPRINT:DHThumidity:LAST:"Cur\:%3.2lf%s" \
GPRINT:DHThumidity:MIN:"Min\:%3.2lf%s" \
GPRINT:DHThumidity:MAX:"Max\:%3.2lf%s" \
GPRINT:DHThumidity:AVERAGE:"Avg\:%3.2lf%s\n" \


#weekly
rrdtool graph $DIR/DHT22_weekly.png --start -1w \
DEF:DHTtemp=$DIR/DHTtemp.rrd:DHTtemp:AVERAGE \
AREA:DHTtemp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=DHTtemp,MAXIMUM \
VDEF:min_temp=DHTtemp,MINIMUM \
GPRINT:DHTtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:DHTtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:DHTtemp:AVERAGE:"Avg\:%3.2lf%s\n" \


rrdtool graph $DIR/humidity_weekly.png --start -1w \
DEF:DHThumidity=$DIR/DHThumidity.rrd:DHThumidity:AVERAGE \
AREA:DHThumidity$HUMIDITY_COLOR:"Paratartalom [deg $HUMIDITY_SCALE]" \
VDEF:max_temp=DHThumidity,MAXIMUM \
VDEF:min_temp=DHThumidity,MINIMUM \
GPRINT:DHThumidity:MIN:"Min\:%3.2lf%s" \
GPRINT:DHThumidity:MAX:"Max\:%3.2lf%s" \
GPRINT:DHThumidity:AVERAGE:"Avg\:%3.2lf%s\n" \


#monthly
rrdtool graph $DIR/DHT22_monthly.png --start -1m \
DEF:DHTtemp=$DIR/DHTtemp.rrd:DHTtemp:AVERAGE \
AREA:DHTtemp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=DHTtemp,MAXIMUM \
VDEF:min_temp=DHTtemp,MINIMUM \
GPRINT:DHTtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:DHTtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:DHTtemp:AVERAGE:"Avg\:%3.2lf%s\n" \

rrdtool graph $DIR/humidity_monthly.png --start -1m \
DEF:DHThumidity=$DIR/DHThumidity.rrd:DHThumidity:AVERAGE \
AREA:DHThumidity$HUMIDITY_COLOR:"Páratartalome [deg $HUMIDITY_SCALE]" \
VDEF:max_temp=DHThumidity,MAXIMUM \
VDEF:min_temp=DHThumidity,MINIMUM \
GPRINT:DHThumidity:MIN:"Min\:%3.2lf%s" \
GPRINT:DHThumidity:MAX:"Max\:%3.2lf%s" \
GPRINT:DHThumidity:AVERAGE:"Avg\:%3.2lf%s\n" \


#yearly
rrdtool graph $DIR/DHT22_yearly.png --start -1y \
DEF:DHTtemp=$DIR/DHTtemp.rrd:DHTtemp:AVERAGE \
AREA:DHTtemp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=DHTtemp,MAXIMUM \
VDEF:min_temp=DHTtemp,MINIMUM \
GPRINT:DHTtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:DHTtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:DHTtemp:AVERAGE:"Avg\:%3.2lf%s\n" \


rrdtool graph $DIR/humidity_yearly.png --start -1y \
DEF:DHThumidity=$DIR/DHThumidity.rrd:DHThumidity:AVERAGE \
AREA:DHThumidity$HUMIDITY_COLOR:"Páratartalom [deg $HUMIDITY_SCALE]" \
VDEF:max_temp=DHThumidity,MAXIMUM \
VDEF:min_temp=DHThumidity,MINIMUM \
GPRINT:DHThumidity:MIN:"Min\:%3.2lf%s" \
GPRINT:DHThumidity:MAX:"Max\:%3.2lf%s" \
GPRINT:DHThumidity:AVERAGE:"Avg\:%3.2lf%s\n" 
