#!/bin/bash
DIR="/home/ubuntu/rrdtool/kinti"

#set to C if using Celsius
TEMP_SCALE="C"
#define the desired colors for the graphs
#INTEMP_COLOR="#CC0000"
OUTTEMP_COLOR="#0000FF"

#hourly
rrdtool graph $DIR/outtemp_hourly.png --start -4h -w 500 -h 200 --lower-limit=-30 --upper-limit=50 \
DEF:outtemp=$DIR/kinti.rrd:outtemp:AVERAGE \
AREA:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=outtemp,MAXIMUM \
VDEF:min_temp=outtemp,MINIMUM \
VDEF:cur_temp=outtemp,LAST \
GPRINT:outtemp:LAST:"Cur\:%3.2lf%s" \
GPRINT:outtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:outtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:outtemp:AVERAGE:"Avg\:%3.2lf%s\n" \


#daily
rrdtool graph $DIR/outtemp_daily.png --start -1d -w 500 -h 200  \
DEF:outtemp=$DIR/kinti.rrd:outtemp:AVERAGE \
AREA:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=outtemp,MAXIMUM \
VDEF:min_temp=outtemp,MINIMUM \
VDEF:cur_temp=outtemp,LAST \
GPRINT:outtemp:LAST:"Cur\:%3.2lf%s" \
GPRINT:outtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:outtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:outtemp:AVERAGE:"Avg\:%3.2lf%s\n" \


#weekly
rrdtool graph $DIR/outtemp_weekly.png --start -1w \
DEF:outtemp=$DIR/kinti.rrd:outtemp:AVERAGE \
AREA:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=outtemp,MAXIMUM \
VDEF:min_temp=outtemp,MINIMUM \
GPRINT:outtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:outtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:outtemp:AVERAGE:"Avg\:%3.2lf%s\n" \


#monthly
rrdtool graph $DIR/outtemp_monthly.png --start -1m \
DEF:outtemp=$DIR/kinti.rrd:outtemp:AVERAGE \
AREA:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=outtemp,MAXIMUM \
VDEF:min_temp=outtemp,MINIMUM \
GPRINT:outtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:outtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:outtemp:AVERAGE:"Avg\:%3.2lf%s\n" \


#yearly
rrdtool graph $DIR/outtemp_yearly.png --start -1y \
DEF:outtemp=$DIR/kinti.rrd:outtemp:AVERAGE \
AREA:outtemp$OUTTEMP_COLOR:"Outside Temperature [deg $TEMP_SCALE]" \
VDEF:max_temp=outtemp,MAXIMUM \
VDEF:min_temp=outtemp,MINIMUM \
GPRINT:outtemp:MIN:"Min\:%3.2lf%s" \
GPRINT:outtemp:MAX:"Max\:%3.2lf%s" \
GPRINT:outtemp:AVERAGE:"Avg\:%3.2lf%s\n" \



