my @text = split(/,/, "1,12,3,3,17,5,2,22,24,10,10,11,19,13,8,6,22,14,14,12,27,6,9,24,2,22,4,9,17,5,14,22,30,19,23,4,9,2");

print scalar(@text);
my $decode;
my $index;

for my $i ('a'..'z') {
	for my $j ('a'..'z') {
		for my $k ('a'..'z') {
			for	($index = 0; $index < scalar(@text); $index++) {
				$decode .= chr(ord($i) ^ $text[$index]) unless ($index % 3);
				$decode .= chr(ord($j) ^ $text[$index]) unless (($index - 1) % 3);
				$decode .= chr(ord($k) ^ $text[$index]) unless (($index -2 ) % 3);
			}
			print $decode unless $decode =~ m/\W/;
			$decode = '';
		}
	}
}

my $d = "findthesumoftheasciivaluesinthisstring";
my $sum;
foreach (split(//, $d)) {
	$sum += ord;
}
print $sum;

# 4108 #
			

