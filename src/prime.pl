use strict;
use warnings;
use bigint;
use integer;

sub prime_gen {
	my $p = shift;

	return sub {
		0 while ! is_valid(++$p);
		return $p;
	}
}

sub is_valid {
	my $p = shift;
	my @p = split(//, $p);
	my $sum = 0;
	map($sum += $_, @p);

	return is_prime($p) && is_prime($sum) ? 1 : 0;
}

sub is_prime {
	my $p = shift;
	my $i;

	for ($i = 2; ($i * $i) <= $p; $i++) {
		return 0 unless ($p % $i);
	}
	return 1;
}

#my $p = prime_gen(1000000);

#my $p1 = $p->();
#my $p2 = $p->();

#print $p1.$p2;
my $sum;
for(2..17591026060787) {
	$sum += $_;
}

print $sum;

		
