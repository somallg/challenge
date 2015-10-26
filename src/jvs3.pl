use strict;
use warnings;
use bigint;

my $year = 513436;
my $add = $year;

while ($add < 395425559298) {
	$add = $year;
	for (my $i = 1; $i <= $year; $i++) {
		$add += $year + $i;
	}
	$year++;
}

print $year;
print $add;
