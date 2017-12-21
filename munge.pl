#!/usr/bin/env perl
use warnings;
use strict;
use v5.14;
use utf8;
use Getopt::Long;
use POSIX qw<ceil floor>;

our $minScale = 0.25;
our $maxScale = 1.95;
our $tilt     = 45;
our $extraCSS = "";

GetOptions(
	"min-scale=f" => \$minScale,
	"max-scale=f" => \$maxScale,
	"tilt=f"      => \$tilt,
	"extra-css=s" => \$extraCSS
);

$extraCSS =~ s/"/&quot;/g;

sub random {
	my $min = shift || 0;
	my $max = shift || 1;
	return floor(rand() * $max - $min + 1) + $min;
}

sub scrawl {
	my $letter = $_[0];
	my $size   = random $minScale, $maxScale;
	my $rot    = random(0, $tilt * 2) - $tilt;
	return qq|<span style="display: inline-block; transform: rotate(${rot}deg) scale($size);${extraCSS}">$letter</span>|;
}

while(<>){
	my @words = split /\s+/;
	for my $word (@words) {
		my @letters = split //, $word;
		print join "", map { scrawl($_) } @letters;
	}
}

print "\n";
