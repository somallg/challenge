use strict;
use warnings;
use Data::Dumper;
use IO::Uncompress::Bunzip2 qw(bunzip2 $Bunzip2Error);

#my $zipIN = 'out.png.bz2';
#my $zipOut = 'out.png';

#my $z = bunzip2($zipIN => $zipOut) && die("unzip failed : $Bunzip2Error");

my $corrupt = 'corrupted.png.bz2';

#open(FILE, "<", $zipIN);
#open(OUT, ">", $corrupt);
#my $line;

#while (defined($line = <FILE>)) {
#	$line =~ s/\n/\r\n/;
#	print OUT $line;
#}

#close(FILE);
#close(OUT);
#die();

chdir('/tmp');
my $data;
my @data;
my @dataTab;
open(FILE, "<", $corrupt);
binmode(FILE);
{
	local $/;
	$data = <FILE>;
#	@data = unpack('(C)*', <FILE>);
}

close(FILE);

#print $data;
@dataTab = split("\r\n", $data);

my $n = scalar(@dataTab);
print $n,"\n";

#open(FILE, ">", "test.png.bz2");
#binmode(FILE);
#print FILE pack('H*', join('', @dataTab));
#close(FILE);
#die();

for (my $t = 0; $t < $n - 1; $t++) {
	$dataTab[$t] .= "\r\n";
}

#$dataTab[$n - 1] =~ s/("\n")*$//g;

my $d = [0..($n-1)];
my $tab = combin(1, 0, $d);

my ($i, $j,$k);
$i = 1;
# remove 1 0d0a at a time 
while(1) {
	my $tab = combin($i, 0, $d);

	foreach my $t (@$tab) {
		print "Cominaison $i of $n \n";
		print ,"\n" foreach (@$t);

		foreach my $index (@$t) {
			$dataTab[$index] =~ s/"\r\n$"/"\n$"/;

		}

		my $out = join('', @dataTab);

		open(FILE, ">", "out.png.bz2");
		binmode(FILE);
		print FILE $out;
		close(FILE);

		# restore dataTab values #
		foreach my $index (@$t) {
			$dataTab[$index] =~ s/"\n$"/"\r\n$"/;
		}

		my $input = 'out.png.bz2';
		my $ouput = 'out.png';

		my $z = bunzip2($input => $ouput) && die "bunzip2 failed : $Bunzip2Error";
		unlink($input);
		unlink($ouput);
	}
		$i++;
}


sub combin {
	my ($n,$start,$tab) = @_; 

	if ($n >= scalar(@$tab)) {
		return [$tab];
	}

	my ($i,$j,$k);
	if ($n == 1) {
		my $tmp; 
		my $res;
		for($i = $start; $i < @$tab; $i++) {
			push (@$tmp, $tab->[$i]);
			push (@$res, $tmp);
			$tmp = [];
		}
		return $res;
	} else {
		my $res;
		for ($i = 0; $i < @$tab; $i++) {
			my $preTab = combin($n - 1, $i + 1, $tab);
			foreach my $p (@$preTab) {
				my @tmp;
				push(@tmp, $tab->[$i]);
               	push(@tmp, @$p);
				push(@$res, \@tmp);
			}
		}

		return $res;
	}
}
