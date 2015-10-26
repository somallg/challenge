use strict;
use warnings;

use WWW::Mechanize;
use GD;
use Data::Dumper;
use integer;

my $mech = WWW::Mechanize->new;
$mech->show_progress(1);

# username and pass
my ( $user, $pass ) = qw/Khoaito Pam382jam/;
$mech->get('http://www.enigmagroup.org/forums/index.php?action=login');
$mech->submit_form(
    form_number => 1,
    fields      => {
        user    => $user,
        passwrd => $pass
    }
);

my $url = 'http://www.enigmagroup.org/missions/programming/7/index.php';
$mech->get($url);

my ( $department ) = $mech->content =~ m/from\sthe\s(.*)\sdepartmen/mg;
my ( $company ) = $mech->content =~ m/Company:\s*(.*?)<br\s\/>/mg;
my ( $data ) = $mech->content =~ m/Company:\s*.*?<br\s\/><br\s\/>(.*?)\s*<br/mg;

my %department;

foreach ( split('\s*Department:\s*', $data) ) {
    my ( $d, $b ) = $_ =~ m/(.*?)\sMonthly\sBudget:\s*\$(\d*)/;
    $department{ $d } += $b;
}

my $submit = 'http://www.enigmagroup.org/missions/programming/7/submit.php';

$mech->post( $submit, [ company => $company,
                        department => $department,
                        total   => $department{$department} ] );
$mech->save_content( 'abc.html' );

