use strict;
use warnings;

use WWW::Mechanize;
use GD;
use Data::Dumper;

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

my $url = 'http://www.enigmagroup.org/missions/programming/8/image.php';
$mech->get( $url );

$mech->save_content( 'abc.png' );
#GD::Image->trueColor( 1 ); # IMPORTANT
my $image = GD::Image->new( 'abc.png' );

foreach my $i (0..49) {
    my $copy = GD::Image->new(250,1);
    $copy->copy($image,0,0,$i,0,250,1);
    open(OUT, '>', "$i.png") or warn $!;
    print OUT $copy->png;
    close OUT;
}


#my $index = $image->getPixel( 0, 0 );
#my ( $r, $g, $b ) = $image->rgb( $index );


#print Dumper join( ';', $r, $g, $b );
#$mech->post( $url, [ color => join( ';', $r, $g, $b ), submit => 1 ] );
#$mech->save_content( 'abc.html' );

