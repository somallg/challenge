use strict;
use warnings;
use integer;

my @x = (65..122);
foreach my $a1 ( @x ) {
    foreach my $a2 ( @x ) {
        foreach my $a3 ( @x ) {
            foreach my $a4 ( @x ) {
                foreach my $a5 ( @x ) {
                    print map(chr, @{[ $a1, $a2, $a3, $a4, $a5 ]}), "\n"
                        if $a1 * 3 + $a2 * 3 + $a3 * 4 + $a4 * 5 + $a5 * 6 == 2308;
                }
            }
        }
    }
}

