use strict;
use warnings;

use WWW::Mechanize;

my $mech = WWW::Mechanize->new;
$mech->show_progress( 1 );
$mech->add_header( Referer => 'admin.enigmagroup.org' );
$mech->add_header( Cookie => 'authorized=true' );

my $url = 'http://www.enigmagroup.org/forums/index.php?action=login';

$mech->get( $url );
$mech->submit_form(
    form_number => 1,
    fields => {
        user => 'somallg',
        passwrd => 'Pam382jam'
});

$mech->get( 'http://www.enigmagroup.org/missions/basics/spoof/5/index.php');

print $mech->content;




