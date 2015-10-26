use integer;
my $str = "1000001000010001010001011000000";
my $hex = unpack('H*', pack('B32', substr("0" x 32 . $str, -32)));

print unpack('f', pack('H*', $hex));
