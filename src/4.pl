use strict;
use warnings;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new;

my $url = 'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=';

my $next = 63579;

while ( 1 ) {
    $mech->get( $url . $next);

    ($next) = ( $mech->content =~ m/is\s(\d*)/ );

    last unless $next;

    print $mech->content, "\n";
}

print $mech->content, "\n";

#peak.html


