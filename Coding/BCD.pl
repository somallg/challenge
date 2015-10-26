use strict;
use warnings;

my @bin = qw(0111 0011 1001 0011 1001 0001);

sub bintodec {
   return unpack("N", pack("B32", substr("0"x 32 . $_ , -32)));
}

foreach (@bin) {
	print bintodec();
}
