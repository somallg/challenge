use strict;
use warnings;

my @tab = (1..4);

sub combin {
	my ($n,$start,$tab) = @_; 

	if ($n >= scalar(@$tab)) {
		return [$tab];
	}

	my ($i,$j,$k);
	if ($n == 1) {
		my $tmp; 
		my $res;
		for($i = $start; $i < @$tab; $i++) {
			push (@$tmp, $tab->[$i]);
			push (@$res, $tmp);
			$tmp = [];
		}
		return $res;
	} else {
		my $res;
		for ($i = 0; $i < @$tab; $i++) {
			my $preTab = combin($n - 1, $i + 1, $tab);
			foreach my $p (@$preTab) {
				my @tmp;
				push(@tmp, $tab->[$i]);
               	push(@tmp, @$p);
				push(@$res, \@tmp);
			}
		}

		return $res;
	}
}

my $tab = combin(6,0,\@tab);

foreach my $t (@$tab) {
	print foreach (@$t);
}
