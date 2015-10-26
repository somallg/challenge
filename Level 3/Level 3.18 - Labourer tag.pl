use Data::Dumper;
use integer;

my $check = 2;

my $sum = 8*2+2*7+3*6+3*5;
my $tab;
my $tmp;
my $s;

for (my $i = 0; $i <= 9; $i++) {
	for (my $j = 0; $j <= 9; $j++) {
		for (my $k = 0; $k <= 9; $k++) {
			$s = $sum + ($i * 4) + ($j * 3) + ($k * 2);
			if ((11 - ($s % 11)) == $check) {
                print $i,$j,$k;
			}
		}
	}
}

#foreach my $t (@$tab) {
#	print (@$t);
#}

#print Dumper($tab);

# 006023037 #


