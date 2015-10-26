use strict;
use warnings;

use WWW::Mechanize;

my $mech = WWW::Mechanize->new;
$mech->show_progress(1);

# username and pass
my ( $user, $pass ) = qw/Khoaito Pam382jam/;
$mech->get( 'http://www.enigmagroup.org/forums/index.php?action=login' );
$mech->submit_form(
    form_number => 1,
    fields      => {
        user    => $user,
        passwrd => $pass 
    }
);

$mech->get('http://www.enigmagroup.org/missions/programming/2/index.php');
my @data = split( /\n/, $mech->content );

my $number;
foreach (@data) {
    if (/E\[number\]/) {
        ( $number ) = $_ =~ m/value="(\d+)"/;
        last
    }
}

$mech->form_number( 1 );
$mech->field( 'answer', $number * 4 );
$mech->click( 'submit' );

$mech->save_content( 'abc.html' );
