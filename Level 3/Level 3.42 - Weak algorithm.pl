use strict;
use warnings;
use Data::Dumper;

my $cipher = "739B9D9895939EA45447A1969B43868C843F89913F3B718B7B7E8D8A347E87318477752D816E6F7B6F6B267E7575662F";

my @data = ( $cipher =~ m/../g );
@data = reverse @data;

my $init = 0;
my $str = '';
foreach ( @data ) {
    my $i = hex($_) - $init;
    if ( $i & 1 ) {
        $str = chr( $i - 1 ) . $str;
    }
    else {
          $str = chr( $i - 3 ) . $str;
    }
    $init++;
}

print Dumper $str;

