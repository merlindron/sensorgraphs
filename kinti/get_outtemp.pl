#!/usr/bin/perl
use LWP::UserAgent;
 
my $dir = '/home/ubuntu/rrdtool/kinti';
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
$rrd = `/usr/bin/rrdtool update $dir/kinti.rrd N:$outtemp`;
#print "Inside temp: $temp\n";
#print "Outside temp: $outtemp\n";
