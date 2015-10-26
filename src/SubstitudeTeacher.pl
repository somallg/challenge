sub substitude {
	my ($o, $r, $str, $tab, $alphabet, $alphabetCrypt) = @_;
	for (my $i = 0; $i < scalar(@$str); $i++) {
		if (($str->[$i] eq $o) && ($tab->[$i] == 0)) {
			$str->[$i] = $r;
			$tab->[$i] = 1;
		}
	}
}

my $str = "ISS NVVK DIPXYWA PIT AVSUY QIAOP PWZEHVNWIEDZ. CDYT ZVM LOTK HDY AVSMHOVT HV HDOA HYFH, ZVM COSS QY IQSY HV NYH HDY ITACYW, CDOPD OA IKMGQWIHY";

my $rep = $str;
my $copy = $str;

my @rep = split(//, $rep);
my @var;
for (my $i = 0; $i < scalar(@rep); $i++) {
	$var[$i] = 0;
}

my @copy = split(//, $copy);

$str =~ s/,//g;
$str =~ s/\.//g;
$str =~ s/\s+//g;

my %tab;
foreach(split(//, $str)) {
	$tab{$_}++;
}

my @sort = sort{$tab{$b} <=> $tab{$a}} keys %tab;

foreach(@sort) {
	print $_, " ",$tab{$_};
}

substitude("Y", "E", \@copy, \@var);
substitude("H", "T", \@copy, \@var);
substitude("V", "O", \@copy, \@var);
substitude("I", "A", \@copy, \@var);
substitude("D", "H", \@copy, \@var);
substitude("N", "G", \@copy, \@var);
substitude("S", "L", \@copy, \@var);
substitude("K", "D", \@copy, \@var);
substitude("F", "S", \@copy, \@var);
substitude("Q", "B", \@copy, \@var);
substitude("Z", "Y", \@copy, \@var);
substitude("M", "U", \@copy, \@var);
substitude("C", "W", \@copy, \@var);
substitude("O", "I", \@copy, \@var);
substitude("T", "N", \@copy, \@var);
substitude("A", "S", \@copy, \@var);
substitude("W", "R", \@copy, \@var);
substitude("L", "F", \@copy, \@var);
substitude("P", "C", \@copy, \@var);
substitude("X", "K", \@copy, \@var);
substitude("U", "V", \@copy, \@var);
substitude("E", "P", \@copy, \@var);
print $rep;
print join("", @copy);
