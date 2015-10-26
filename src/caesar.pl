use strict;
use warnings;

#my $str = "UIF RVJDL CSPXO GPY KVNQT PWFS UIF MBAZ EPH PG DBFTBS BOE ZPVS VOJRVF TPMVUJPO JT HNMNCSFECENI";

my $str = "dvoowlmvgsvdliwblfhvvprhzgyzhs";

my $l = length($str);

for (my $i = 1; $i < 25; $i++) {

	my $decode = $str;
	for (my $j = 0 ; $j < $l; $j++) {
		next if (substr($str, $j, 1) eq ' ');
		substr($decode, $j, 1) = chr((((ord(substr($str, $j, 1)) - $i) + 'a') % 26) - 'a');
	}

	print $decode;
}
