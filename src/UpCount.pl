use strict;
use warnings;
use bigint;

sub calc {
	my $depth = shift;
	return 1 if $depth == 0;
    my $cc = calc($depth - 1);
	return $cc + ($depth % 7) + (((($cc ^ $depth) % 4) == 0) ? 1 : 0);
}

#print calc(11589);

my $n = ((17 ** 39) ** 11);
my $i = 0;
my $answer;

while ($i < length($n)) {
      $answer .= substr($n, $i, 1);
	  $i += 33;
}

print $answer;
     
