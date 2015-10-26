use bigint;
my $a = 28679718602997181072337614380936720482949;
my $b;
my $str;

while ($a > 0) {
	$b = $a % 7;
	$a /= 7;
	$str .= $b;
}

print scalar reverse $str;
