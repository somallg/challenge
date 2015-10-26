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

$mech->get( 'http://www.rankk.org/challenges/xxxii.py' );

my $data = $mech->content;
$data =~ s/[^a-zA-Z0-9]//g;

print Dumper $data;

$mech->get( 'http://www.rankk.org/challenges/too-slow.py?solution=' . $data);



