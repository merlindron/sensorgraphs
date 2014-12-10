#!/usr/bin/perl
use LWP::UserAgent;
 
my $dir = '/home/ubuntu/rrdtool/ds18b20';
my $metar_url = 'http://weather.noaa.gov/pub/data/observations/metar/stations/LHBP.TXT';
my $is_celsius = 1; #set to 1 if using Celsius
 
my $ua = new LWP::UserAgent;
$ua->timeout(120);
my $request = new HTTP::Request('GET', $metar_url);
my $response = $ua->request($request);
my $metar= $response->content();
#print $metar; 

$metar =~ /([\s|M])(\d{2})\//g;
#print $metar;
$outtemp = ($1 eq 'M') ? $2 * -1 : $2; #'M' in a METAR report signifies below 0 temps
$outtemp = ($is_celsius) ? $outtemp + 0 : ($outtemp * 9/5) + 32;
#print $outtemp; 
$modules = `cat /proc/modules`;
if ($modules =~ /w1_therm/ && $modules =~ /w1_gpio/)
{
        #modules installed
}
else
{
        $gpio = `sudo modprobe w1-gpio`;
        $therm = `sudo modprobe w1-therm`;
}
 
$output = "";
$attempts = 0;
while ($output !~ /YES/g && $attempts < 5)
{
        $output = `sudo cat /sys/bus/w1/devices/28-001415402dff/w1_slave 2>&1`;
        if($output =~ /No such file or directory/)
        {
                print "Could not find DS18B20\n";
                last;
        }
        elsif($output !~ /NO/g)
        {
                $output =~ /t=(\d+)/i;
                $temp = ($is_celsius) ? ($1 / 1000) : ($1 / 1000) * 9/5 + 32;
                $rrd = `/usr/bin/rrdtool update $dir/ds18b20.rrd N:$temp:$outtemp`;
        }
 
        $attempts++;
}
 
#print "Inside temp: $temp\n";
#print "Outside temp: $outtemp\n";
