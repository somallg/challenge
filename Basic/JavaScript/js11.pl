use strict;
use warnings;
use integer;
use Data::Dumper;

my @cl = 'a'..'z';

sub decode {
    my $n = shift;

    return if $n <= 0;
    
    foreach ( 1..26 ) {
        if ( ( $n - $_ ) % 17 == 0 ) {
            print $_, ">", ( $n - $_ ) /17, "\n";
            return join( ',', decode( ( $n - $_ ) / 17 ), $_); 
        }
    }
}

print $cl[$_-1] foreach split( /,/, decode( 248410397744610 ));
print "\n";
