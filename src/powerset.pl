use strict;
use warnings;

use integer;

my @tab = ('a'..'t');
my %tab;
my $i = 0;

foreach (@tab) {
	$tab{$_} = $i++;
}
my @key = keys %tab;
my @values = values %tab;

#print foreach (@key);
#print foreach(@values);

my @bit;

for ($i = 0; $i < scalar(@tab); $i++) {
	$tab[$i] = 1 << $i;
}

#print foreach(@tab);

my $powerset;
my $subset;
my $nmember = 2 << scalar(@tab);
print $nmember;

#print $nmember;

for ($i = 0; $i < $nmember; $i++) {
	print "i = ", $i;
	last if ($i < 0);
	$subset = {};
	for (my $j = 0; $j < scalar(@tab); $j++) {
		$subset->{$key[$j]} = $values[$j] if $i & $tab[$j];
	}
	$powerset->{$subset} = $subset;
}

foreach my $k (keys %$powerset) {
	print (sort keys %{$powerset->{$k}});
}    





