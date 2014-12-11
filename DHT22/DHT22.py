#!/usr/bin/python
import sys
import rrdtool
import Adafruit_DHT
sensor = Adafruit_DHT.DHT22
pin = 'P8_11'
dir1='/home/ubuntu/rrdtool/DHT22/DHTtemp.rrd'
dir2='/home/ubuntu/rrdtool/DHT22/DHThumidity.rrd'
#print dir1
#print dir2
# Parse command line parameters.
#sensor_args = { '11': Adafruit_DHT.DHT11,
#				'22': Adafruit_DHT.DHT22,
#				'2302': Adafruit_DHT.AM2302 }

#sensor_args = "22"

#if len(sys.argv) == 3 and sys.argv[1] in sensor_args:
#	sensor = sensor_args[sys.argv[1]]
#	pin = sys.argv[2]
#else:
#	print 'usage: sudo ./Adafruit_DHT.py [11|22|2302] GPIOpin#'
#	print 'example: sudo ./Adafruit_DHT.py 2302 4 - Read from an AM2302 connected to GPIO #4'
#	sys.exit(1)

# Try to grab a sensor reading.  Use the read_retry method which will retry up
# to 15 times to get a sensor reading (waiting 2 seconds between each retry).
humidity, temperature = Adafruit_DHT.read_retry(sensor,pin)

# Note that sometimes you won't get a reading and
# the results will be null (because Linux can't
# guarantee the timing of calls to read the sensor).  
# If this happens try again!
#if humidity is not None and temperature is not None:
#	print 'Temp={0:0.1f}*C  Humidity={1:0.1f}%'.format(temperature, humidity)
#else:
#	print 'Failed to get reading. Try again!'

#rrd_temp= rrdtool.update (dir, 'N:%s' % temperature)

#if rrd_temp:
 #   print rrdtool.error()
#print rrd_temp
#temperature={0:0.1f}.format(temperature)
temperature = "{:.1f}".format(temperature)
humidity = "{:.1f}".format(humidity)
#print temperature 
#print humidity 

#while 1:
# total_input_traffic += random.randrange(1000, 1500)
 #total_output_traffic += random.randrange(1000, 3000)
rrdtool.update(dir1,'N:%f' %float(temperature))
rrdtool.update(dir2,'N:%f' %float(humidity))
