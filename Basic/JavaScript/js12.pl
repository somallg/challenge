use strict;
use warnings;
use integer;
use bigint;

my $pass = 318_338_237_039_211_050_000;
my $year = 158000;

while ( 1 ) {
    my $sum = $year**3 * ( $year + 1 ) / 2 + 1337;
    last if $sum == $pass;
    last if $sum > $pass;
    $year++;
}

print $year;
    

