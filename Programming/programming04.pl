use strict;
use warnings;

use WWW::Mechanize;
use GD;
use Data::Dumper;

my $mech = WWW::Mechanize->new;
$mech->show_progress(1);

# username and pass
my ( $user, $pass ) = qw/Khoaito Pam382jam/;
$mech->add_header( Referer => 'http://www.enigmagroup.org/missions/programming/4/index.php');
$mech->get( 'http://www.enigmagroup.org/forums/index.php?action=login' );
$mech->submit_form(
    form_number => 1,
    fields      => {
        user    => $user,
        passwrd => $pass 
    }
);

my $url = 'http://www.enigmagroup.org/missions/programming/4/image.php';
$mech->get( $url );

$mech->save_content( 'abc.jpeg' );
GD::Image->trueColor( 1 ); # IMPORTANT
my $image = GD::Image->new( 'abc.jpeg' );

my ($x, $y) = $image->getBounds();
my @tmp;

foreach my $j (0..$y-1) {
    foreach my $i (0..$x-1) {
        my $index = $image->getPixel( $i, $j );
        my ( $r, $g, $b ) = $image->rgb( $index );
        push @tmp, $r == 255 ? 0 : 1;
    }
}

my ( @data );
my ( $data );
while ( @data = splice @tmp, 0 ,8 ) {
    my $bin = join('', @data);
    my $dec = unpack("N", pack("B32", substr('0'x32 . $bin, -32 )));
    $data .= chr($dec);
}

my ( $res ) = $data =~ m/next:(.*)$/;
print Dumper $data, $res;
$mech->post( $url, [ answer => $res, submit => 1 ] );
#$mech->save_content( 'abc.html' );

