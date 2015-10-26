my $str = "31cf55aa0c91fb6fcb33f34793fe00c72ebc4c88fd57dc6ba71e71b759d83588";

$str =~ s/(\w)(\w)/$1$2 /g;
my @str = split(/\s/, $str);

for my $x (0..255) {
	for my $b (0..255) {
		my $decode = '';
		foreach (@str) {
			$decode .= chr(hex($_) ^ $b);
			$b = ($b + $x) % 256;
		}
		print $decode, "\n";
	}
}
