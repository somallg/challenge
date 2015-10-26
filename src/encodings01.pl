use strict;
use warnings;

#my $str = "10000001";

my $str = "01110101 01110011 01100101 00100000 01110111 01100101 01100100 01101110 01100101 01110011 01100100 01100001 01111001 00100000 01100110 01101111 01110010 00100000 01110100 01101000 01100101 00100000 01100001 01101110 01110011 01110111 01100101 01110010";

$str =~ s/\n//g;
#print $str;
my $index = 0;
my @str;

#while ($index < length($str)) {
#	push(@str, substr($str, $index, 7));
#	$index += 7;
#}

@str = split(/\s+/, $str);

#print foreach @str;

#print $str[0];
#print pack('C', unpack('N', pack('B32', substr("0" x 32 . $str[0], -32))));

foreach my $t (@str) {
	print pack('C', unpack('N', pack('B32', substr("0" x 32 . $t, -32))));
}
