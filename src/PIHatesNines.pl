use bigint;
my $pi;
{
	local $/;
	open(FILE, "<", "pi.data");
	$pi = <FILE>;
	close(FILE);
}

$pi =~ s/\n//g;
print $pi =~ s/\s+//g;
print length($pi);
#print $pi;

my $p = "999934959234599";         

my (@seq) = split(/9/, $pi);

#print scalar(@seq);

@seq = sort({length($b) <=> length($a)} @seq);
print $seq[0];
