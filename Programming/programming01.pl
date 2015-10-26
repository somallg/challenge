use strict;
use warnings;

use WWW::Mechanize;

my $mech = WWW::Mechanize->new;
$mech->show_progress( 1 );
#$mech->add_header( Referer => 'admin.enigmagroup.org' );
$mech->add_header( Cookie => 'mission=yes' );

my $url = 'http://www.enigmagroup.org/forums/index.php?action=login';

$mech->get( $url );
$mech->submit_form(
    form_number => 1,
    fields => {
        user => 'Khoaito',
        passwrd => 'Pam382jam'
});

$mech->post(
    'http://www.enigmagroup.org/missions/programming/1/',
    [
        'ip' => '81.64.166.76',
        'username' => 'Khoaito'
    ]
);

print $mech->content;
