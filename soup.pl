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


__END__

=head1 SYNOPSIS

B<soup.pl> [I<OPTIONS>] E<lt> I<input.txt> E<gt> I<output.html>


=head1 DESCRIPTION

Generate a chaotic writing effect in HTML by randomly transforming each letter.

=begin markdown

![How Pythonistas see Perl](preview.png)

=end markdown


=head1 OPTIONS

=over

=item B<--min-scale> [I<ratio>=I<0.25>]

Specify the minimum scale ratio.
Defaults to 0.25.

=item B<--max-scale> [I<ratio>=I<1.95>]

Specify the maximum scale ratio.
Defaults to 1.95.

=item B<--tilt> [I<angle>=I<45>]

Maximum offset to rotate each letter by.
Defaults to 45 degrees.

=item B<--extra-css> [I<string>]

Additional CSS properties to assign each transformed letter.
Defaults to the empty string.

=back


=head1 EXAMPLES

Generate evenly-sized text with wildly varying rotation:

	soup.pl --min-scale=1 --max-scale=1 --tilt=360 < input.txt

Generate text with randomly enlarged characters (without shrinking or tilting):

	soup.pl --min-scale=1 --max-scale=3 --tilt=0 < input.txt

Generate yellow-coloured text in Comic Sans:

	soup.pl --extra-css="color: #ff0; font-family: Comic Sans MS" < input.txt


=head1 AUTHOR

Copyright E<copy> 2017, Alhadis E<lt>I<gardnerjohng@gmail.com>E<gt>.
Written for a friend.

=cut
