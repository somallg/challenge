use strict;
use warnings;

my $sum;
foreach (1..2118) {
	$sum += $_ * 2 , next if is_square($_);
	$sum += $_;
}

print $sum;

sub is_square {
	my $n = shift;

	return 1 if ($n == 1);

	for (my $i = 1; $i < $n; $i++) {
		return 1 if ($i * $i) == $n;
		return 0 if ($i * $i) > $n;
	}

	return 0;
}

print is_square(2) ? "oui" : "non";

