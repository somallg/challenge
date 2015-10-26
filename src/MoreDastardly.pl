my $str = "16b87ecc17e3568c83d2d55d8c0d7260";
print length($str);
my $str2 ="d41d8cd98f00b204e9800998ecf8427e";
print length($str2);
die();
$str =~ s/(\w)(\w)/$1$2 /g;
print $str;

for my $i (1..255) {
	my $decode = '';
	foreach (split(/\s/, $str)) {
		$decode .= chr(hex($_) + $i);
	}

	print $decode;
}
