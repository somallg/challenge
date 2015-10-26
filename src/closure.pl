use strict;
use warnings;

print pack('H*', 59);
die();

my @DNA = (1..3);
my $seq = gen_permutate(2, @DNA);

while(my $strand = $seq->() ) {
	#print "$strand" if (split(',',$strand) >= 2);
}

sub gen_permutate {
	my ($max, @list) = @_;

	my @curr;

	return sub {
		#print join('', map {$list[$_]} @curr);
		if ((join '', map {$list[$_]} @curr) eq $list[-1] x @curr) {
			@curr = (0) x (@curr + 1);
		} else {
			my $pos = @curr;

			while (--$pos > -1) {
				++$curr[$pos], last if $curr[$pos] < $#list;
				$curr[$pos] = $curr[($pos - 1)%@list] + 1; 
			}

		}

		return undef if @curr > $max;
		#return undef if (join('', @curr) != join('', sort @curr));
		print @curr;
		return join ',', map {$list[$_]} @curr;
	};                
}
