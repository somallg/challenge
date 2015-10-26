my $str;
{
	local $/;
	open(FILE, "<", "snifflog.txt");
	$str = <FILE>;
}
#my $str = "a2 a5";
$str =~ s/\s//g;
$str =~ s/(\w)(\w)/$1$2 /g;

print $str;
my $decode;

foreach my $t (split(/\s/, $str)) {
#	print $t;
	my $hex = hex($t) ^ hex("a5");
	$hex = sprintf("%x", $hex);
	$hex = "0" . $hex if (scalar(split(//, $hex)) <= 1); 
	print $hex;
	$hex =~ s/(\w)(\w)/$2$1/;
	print $hex;
	$decode .= chr(hex($hex));
}

print $decode;
