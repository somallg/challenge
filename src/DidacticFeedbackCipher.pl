my $str = "751a6f1d3d5c3241365321016c05620a7e5e34413246660461412e5a2e412c49254a24";

$str =~ s/(\w)(\w)/$1$2 /g;
my @str = split(/\s/, $str);
my $key;
my $c;

for my $i (0..255) {
	my $decode = '';
	$key = $i;
	foreach (@str) {
		$c = hex($_) ^ $k;
		$k = $c;
		$decode .= chr($c);
	}
	print $decode, "\n";
}
