use strict;
use warnings;
use integer;

my $max = 0;
my $nmax = 0;

foreach (1000 .. 9999) {
	my $k = kapre($_);
	if ($max < $k) {
		$max = $k;
		$nmax = $_;
	}
	print;
}

print $max;
print kapre($nmax);

sub kapre {
	my $n = shift;
	my $iter = 0;
	do {
		my @n = split('', $n);
		my @asc = sort({$b <=> $a} @n);
		my @des = sort({$a <=> $b} @n);

		my $asc = join('', @asc);
		my $des = join('', @des);

		$n = $asc - $des;
		return 0 if (! $n);
		print $asc, " - " , $des, " = ", $n;
		$iter++;
	} while($n != 6174);

	return $iter;
}

sub isKaprekar {
	my $n = shift;
	#print $n;
	my $double = $n * $n;
	#print $double;

	my $first = substr($double, 0, length($n));
	#print $first;
	my $last = substr($double, length($n));
	#print $last;

	return 0 if ($last eq "");

	if (($n == ($first + $last))) {
		return 1;
	} else {
		$first = substr($double, 0, length($n) - 1);
		#print $first;
		$last = substr($double, length($n) - 1);
		#print $last;
		return 0 if ($last eq "");
		return 0 if ($first eq "");

		return 1 if (($n == ($first + $last)));
	}
		
	return 0;
}

print("OK") if (isKaprekar(702));

print "\nKaprekar number\n";
foreach (1 .. 1000) {
	print if (isKaprekar($_));
}


	
