#!/usr/bin/perl
use warnings;
use strict;

my @matches;
my $str;
my $out;
my $cur;
my $len;

$_ = <STDIN>;

@matches = /[\\]{1}[x]{1}([0-9A-Fa-f]{2})/g;

foreach(@matches) {
	$str .= chr(hex "0x$_");
}

$cur = 0
$len = length $str;
$out = "";

while($cur < $len) {
	if(substr($str,$cur,1) eq "%") {
		$out .= chr(hex "0x".substr($str,$cur+1,2));
		$cur += 3;
	}
	else {
		$out .= substr($str,$cur,1);
		$cur++;
	}
}

print "\n$str\n\n$out\n";
