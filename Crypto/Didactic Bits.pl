my $str = "abbbabaaabbabaaaabbaababaabaaaaaabbaaaababbabbbaabbbaabbabbbabbbabbaabababbbaabaaabaaaaaabbabaababbbaabbaabaaaaaabbaaaababbaabaaabbbabababbabbababbaaabaabbbaabaabbaaaababbbabaaabbaabab";


$str =~ s/a/0/g;
$str =~ s/b/1/g;
my @str;

my $index = 0;

while($index < length($str)) {
	push(@str, substr($str, $index, 8));
	$index += 8;
}

print pack("(B8)*", @str);
