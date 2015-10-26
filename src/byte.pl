use strict;
use warnings;
use integer;

my @tmp;
for (3..10) {
	push(@tmp, $_*$_);
}

my $sum = 0;
map($sum += $_ * ($_ - 1), @tmp);

print $sum;

sub bit_test {
	return ($_ & ($_ - 1));
}

for (1..50) {
	print $_, " ", bit_test();
}

