use strict;
use warnings;

my $str = "3d 2e 21 2b 20 22 6f 3c 2a 2a 2b";

foreach (split(/\s/, $str)) {
	print chr(hex($_) ^ 79);
}
