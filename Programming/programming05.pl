use strict;
use warnings;

use WWW::Mechanize;
use GD;
use Data::Dumper;

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

my $url = 'http://www.enigmagroup.org/missions/programming/5/index.php';
$mech->get($url);

my @content = split( /\n/, $mech->content );
my $bf;
foreach ( @content ) {
    if (/<br\s\/>\++/) {
        ($bf) = $_ =~ m/>(.*?)<br/;
    }
}

my @data;    # data array
my $sp;      # pointer counter
my $code;
my $out;

foreach ( split( //, $bf ) ) {
    print Dumper;
    $code .= '$data[$sp]++;'              if ( $_ eq '+' );
    $code .= '$data[$sp]--;'              if ( $_ eq '-' );
    $code .= '$sp++;'                     if ( $_ eq '>' );
    $code .= '$sp--;'                     if ( $_ eq '<' );
    $code .= 'while ( $data[$sp] > 0 ) {' if ( $_ eq '[' );
    $code .= '}'                          if ( $_ eq ']' );
    $code .= 'print chr( $data[$sp] );$out .= chr( $data[$sp] );'
        if ( $_ eq '.' );
}
eval $code;

$mech->get( $url . '?ans=' . $out );
$mech->save_content( 'abc.html' );
