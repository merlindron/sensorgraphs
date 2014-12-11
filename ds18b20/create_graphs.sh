#!/bin/bash
DIR="/home/ubuntu/rrdtool/ds18b20"

#set to C if using Celsius
TEMP_SCALE="C"
#define the desired colors for the graphs
INTEMP_COLOR="#336699"


#hourly
rrdtool graph $DIR/temp_hourly.png --start -4h -w 500 -h 200 \
DEF:temp=$DIR/ds18b20.rrd:temp:AVERAGE \
AREA:temp$INTEMP_COLOR:"Water Temperature" \
VDEF:max_temp=temp,MAXIMUM \
VDEF:min_temp=temp,MINIMUM \
VDEF:cur_temp=temp,LAST \
GPRINT:temp:LAST:"Cur\:%3.2lf%s" \
GPRINT:temp:MIN:"Min\:%3.2lf%s" \
GPRINT:temp:MAX:"Max\:%3.2lf%s" \
GPRINT:temp:AVERAGE:"Avg\:%3.2lf%s\n" \
#daily
rrdtool graph $DIR/temp_daily.png --start -1d -w 500 -h 200  \
DEF:temp=$DIR/ds18b20.rrd:temp:AVERAGE \
AREA:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=temp,MAXIMUM \
VDEF:min_temp=temp,MINIMUM \
VDEF:cur_temp=temp,LAST \
GPRINT:temp:LAST:"Cur\:%3.2lf%s" \
GPRINT:temp:MIN:"Min\:%3.2lf%s" \
GPRINT:temp:MAX:"Max\:%3.2lf%s" \
GPRINT:temp:AVERAGE:"Avg\:%3.2lf%s\n" \



#weekly
rrdtool graph $DIR/temp_weekly.png --start -1w \
DEF:temp=$DIR/ds18b20.rrd:temp:AVERAGE \
AREA:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=temp,MAXIMUM \
VDEF:min_temp=temp,MINIMUM \
GPRINT:temp:MIN:"Min\:%3.2lf%s" \
GPRINT:temp:MAX:"Max\:%3.2lf%s" \
GPRINT:temp:AVERAGE:"Avg\:%3.2lf%s\n" \


#monthly
rrdtool graph $DIR/temp_monthly.png --start -1m \
DEF:temp=$DIR/ds18b20.rrd:temp:AVERAGE \
AREA:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=temp,MAXIMUM \
VDEF:min_temp=temp,MINIMUM \
GPRINT:temp:MIN:"Min\:%3.2lf%s" \
GPRINT:temp:MAX:"Max\:%3.2lf%s" \
GPRINT:temp:AVERAGE:"Avg\:%3.2lf%s\n" \


#yearly
rrdtool graph $DIR/temp_yearly.png --start -1y \
DEF:temp=$DIR/ds18b20.rrd:temp:AVERAGE \
AREA:temp$INTEMP_COLOR:"Inside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=temp,MAXIMUM \
VDEF:min_temp=temp,MINIMUM \
GPRINT:temp:MIN:"Min\:%3.2lf%s" \
GPRINT:temp:MAX:"Max\:%3.2lf%s" \
GPRINT:temp:AVERAGE:"Avg\:%3.2lf%s\n" \

