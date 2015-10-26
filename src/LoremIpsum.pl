my $content;
{
	local $/;
	open(FILE, "<", "lorem.txt") or die($!);
	$content = <FILE>;
	close(FILE);
}

my @content = split(/\s+/, $content);

foreach my $c (@content) {
	$c =~ s/\W//g;
}

my %content;
foreach(@content) {
	$content{$_}++;
}

my ($answer) = grep($content{$_} == 1, keys %content);
print $answer;
