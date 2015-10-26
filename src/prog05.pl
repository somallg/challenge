use WWW::Mechanize;
use bigint;

my $mech = WWW::Mechanize->new();
$mech->add_header(Cookie => 'PHPSESSID=40b0ae3a92d05bf165a77adb8a231502');
$mech->get("http://www.bright-shadows.net/challenges/programming/calculate/tryout.php");

my ($str) = $mech->content =~ m/"(.*)"$/;

my ($left , $right) = $str =~ m/(.+)=(.+)/;

print $left;
print $right;

my (@leftVar) = $left =~ m/[a-z]/g;
my (@rightVar) = $right =~ m/[a-z]/g;
my %hash;

$hash{$_}++ foreach(@leftVar);
$hash{$_}++ foreach(@rightVar);

my @var = (sort keys %hash);
my $i = 0;

foreach (@var) {
	$_ = 0;
}

foreach(sort keys %hash) {
	$hash{$_} = 0;
}

foreach (sort keys %hash) {
	#print $_, " ", $hash{$_};
}

$left =~ s/\*(.)/\*\$hash\{$1\}/g;
$right =~ s/\*(.)/\*\$hash\{$1\}/g;

$left =~ s/\_/\*\*/g;
$right =~ s/\_/\*\*/g;

print $left;
print $right;
my $evalLeft, $evalRight;
my $index = 0;
print "\n";
while (1) {
	#print foreach (@var);
	#print "\n";
	#print $_, " ", $hash{$_},"\n" foreach(sort keys %hash);

	$evalLeft = eval($left);
	$evalRight = eval($right);	
	
	#print $evalLeft, " ", $evalRight, "\n";

	last if ($evalLeft == $evalRight);

	$var[0]++;
	for (my $j = 0; $j < scalar(@var); $j++) {
		if ($var[$j] > 9) {
			$var[$j+1]++;
			$var[$j] = 0;
			$index++;
		}
	}
		
		
	@hash{sort keys %hash} = @var;

}
print $evalLeft, " ", $evalRight;
print $_, " ", $hash{$_} foreach(sort keys %hash);
my $res;
foreach (sort keys %hash) {
	$res .= $hash{$_};
}

print $res, "\n";

$mech->get("http://www.bright-shadows.net/challenges/programming/calculate/solution.php?solution=" . $res);

print $mech->content;
	
	





