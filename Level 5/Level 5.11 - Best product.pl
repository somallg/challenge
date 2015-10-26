use strict;
use warnings;
use Data::Dumper;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new;
$mech->get('http://www.rankk.org');

$mech->submit_form(
    form_number => 1,
    fields      => {
        username => 'Khoaito',
        passwd   => ''
    }
);

$mech->get( 'http://www.rankk.org/challenges/best-product.py' );

my $data = $mech->content;
$data =~ s/\n//g;
($data) = $data =~ m/<table>(.*)<\/table>/g;
my @tab = $data =~ m/<td>(\d*)<\/td>/g;

print Dumper @tab;


