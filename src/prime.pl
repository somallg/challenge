use strict;
use warnings;
use bigint;

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

#my $p = 7393913335919140050521110339491123405991919445111971;		
#my $sq = sqrt $p;

#my $i;
#for ($i = 2; $i < $sq; $i++) {
#	last unless $p % $i;
#}

#print $i;
my @p = split('%', '%66%75%67%6C%79');
print unpack('H*', pack('(C)*', @p));
