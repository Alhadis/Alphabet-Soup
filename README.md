# SYNOPSIS

**soup.pl** \[_OPTIONS_\] < _input.txt_ > _output.html_

# DESCRIPTION

Generate a chaotic writing effect in HTML by randomly transforming each letter.

# OPTIONS

- **--min-scale** \[_ratio_=_0.25_\]

    Specify the minimum scale ratio.
    Defaults to 0.25.

- **--max-scale** \[_ratio_=_1.95_\]

    Specify the maximum scale ratio.
    Defaults to 1.95.

- **--tilt** \[_angle_=_45_\]

    Maximum offset to rotate each letter by.
    Defaults to 45 degrees.

- **--extra-css** \[_string_\]

    Additional CSS properties to assign each transformed letter.
    Defaults to the empty string.

# EXAMPLES

Generate evenly-sized text with wildly varying rotation:

        soup.pl --min-scale=1 --max-scale=1 --tilt=360 < input.txt

Generate text with randomly enlarged characters (without shrinking or tilting):

        soup.pl --min-scale=1 --max-scale=3 --tilt=0 < input.txt

Generate yellow-coloured text in Comic Sans:

        soup.pl --extra-css="color: #ff0; font-family: Comic Sans MS" < input.txt

# AUTHOR

Copyright © 2017, Alhadis <_gardnerjohng@gmail.com_>.
Written for a friend.
