use strict;
use warnings;

my $x;

foreach my $y (1..100) {
      $x += $y*$y+$y+1;
}

print $x;
