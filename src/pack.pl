use strict;
use warnings;

#my $fileName = "images.jpg.bz2";
my $fileName = "corrupted.png.bz2";
my $data;
my $w;

open(FILE, "<", $fileName) or die();
binmode(FILE);
{
local $/;
$data = unpack('H*', <FILE>);
}
close(FILE);

#$w = $data =~ s/0d0a/00/g;
my @index;
my $i = 0;
my $max = length($data);

while (-1 != ($i = index($data, '0d0a', $i))) {
	push(@index, $i);
	$i += 4;
}

print foreach (@index);


