#!/usr/bin/perl
use strict;
use warnings;
use integer;
use Data::Dumper;

my $x = '827400716220761113112780188862593389002185976803643291005369';
my $decode;

my $index = 0;
my $init = 97;
while ( my $i = substr $x, $index, 2 ) {
    my $d = decode( $init, $i );
    $d = '0' . $d if $d < 10;
    print "decode( $init, $i ) = $d\n";
    $decode .= $d;
    $init = $init - 3;
    $index += 2;
    last if $index > length $x;
}

print Dumper $decode;

sub decode {
    my ( $init, $number ) = @_;
    
    my $i = 1;
    while ( 1 ) {
        $init = ( $init + 7 ) % 100;
        last if $init == $number;
        $i++;
    }

    return $i;
}
