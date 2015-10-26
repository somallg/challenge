use strict;
use warnings;
use integer;
use Data::Dumper;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new;
$mech->show_progress(1);
$mech->get('http://www.rankk.org');

$mech->submit_form(
    form_number => 1,
    fields      => {
        username => 'Khoaito',
        passwd   => ''
    }
);

$mech->get( 'http://www.rankk.org/challenges/sudoku-iii.py' );

my $data = $mech->content;
$data =~ s/\n//g;
($data) = $data =~ m/<pre>(.+)<\/pre>/g;
$data =~ s/\s//g;
$data =~ s/_/0/g;

my @A = split //, $data;
our $res;

sub R {
    for my $i ( 0 .. 80 ) {
        next if $A[$i];
        my %t = map {
                 $_ / 9 == $i / 9
              || $_ % 9 == $i % 9
              || $_ / 27 == $i / 27 && $_ % 9 / 3 == $i % 9 / 3
              ? $A[$_]
              : 0 => 1
        } 0 .. 80;
        R( $A[$i] = $_ ) for grep { !$t{$_} } 1 .. 9;
        return $A[$i] = 0;
    }
    die @A;
}

eval { R() };
if ($@) {
    $data = $@;
    $data =~ s/\sat.+//;
    print Dumper $data;
    $mech->get( 'http://www.rankk.org/challenges/sudoku-iii.py?solution=' . $data);
}
