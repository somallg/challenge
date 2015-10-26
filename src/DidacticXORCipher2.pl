my $str = "948881859781c4979186898d90c4c68c85878f85808b8b808881c6c4828b96c4908c8d97c4878c858888818a8381";

$str =~ s/(\w)(\w)/$1$2 /g;
my @str = split(/\s/, $str);
my $decode = "";

for my $i (0..255) {
	$decode = "";
	foreach (@str) {
		$decode .= chr(hex($_) ^ $i);
	}
	print $decode, "\n" if $decode =~ m/challenge/i;
}
