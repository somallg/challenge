use bigint;

my $x;
my $file = "pseu";

#if (! -f $file) {
#	$x = 42 ** 99999;
#	open(FILE, ">", $file);
#	print FILE $x;
#	close(FILE);
#} else {
open(FILE, "<", $file);
local $/;
chomp($x = <FILE>);
close(FILE);
#}

#my $x = "1234567890";
#print length($x);
my $y = "123456789";
my $l = length($x);
print substr($y, 8, 1);
print $l;
my $index = 0;
while (1) {
	no warnings;
	substr($x, $index, 1) = 'x';
	$index += 2;

	#print if $index >= $l;

	if ($index >= $l) {
		$x =~ s/x//g;
		$index = 0;
		$l = length($x);
	}

	last if length($x) <= 10;
}

print $x;
#while(length($x) > 18) {
#$x =~ s/(\d)(\d)/$1/g;
#}
#print $x;

