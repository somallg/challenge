use strict;
use warnings;

sub ceasar {
	my ($n, $t) = @_;
	#my @alphabet = ('a'..'z');
	#foreach my $t (@alphabet) {
	my $res = chr((((ord($t) + $n) - ord('a')) % 26) + ord('a'));
	#}

	return $res;
}

my $str = "cqrb lryqna rb fjh, fjh qjamna cqjw axc cqracnnw. qnan, hxd wnena twxf qxf oja cx bqroc! xq kh cqn fjh, cqn jwbfna rb mnjmvjwblqnbc.";

my @alphabet = ('a'..'z');
my @crypt;
for my $i (1..25) {
	my @tmp = split(//, $str);
	foreach my $t (@tmp) {
		if ((ord($t) >= ord('a')) && (ord($t) <= ord('z'))) {
			$t = ceasar($i, $t);
		}
	}

	print join("", @tmp);

}

