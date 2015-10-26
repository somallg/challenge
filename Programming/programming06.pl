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
$mech->add_header(
    Referer => 'http://www.enigmagroup.org/missions/programming/6/index.php' );
$mech->get('http://www.enigmagroup.org/forums/index.php?action=login');
$mech->submit_form(
    form_number => 1,
    fields      => {
        user    => $user,
        passwrd => $pass
    }
);

open FILE, '<keywords.txt' or die;
my (%keywords);
while (<FILE>) {
    chomp;

    #s/[^a-zA-Z0-9() -$]//g;
    s/.$//;
    $keywords{ join( '', sort split( '', $_ ) ) } = $_;
}
close FILE;

my $url = 'http://www.enigmagroup.org/missions/programming/6/index.php';
$mech->get($url);

my $mark = 0;
my @list;
foreach ( split( '\n', $mech->content ) ) {
    next unless /class="style7"/ or $mark;
    s/<br\s\/>//;
    push @list, $_;
    $mark = 1;
    $mark = 0 if /^<\/p>$/;
}

shift @list;
pop @list;
my @res;
foreach (@list) {
    print Dumper [$_, $keywords{join('', sort split('', $_ ) )}];
    push @res, $keywords{ join( '', sort split( '', $_ ) ) };
}

my $submit = 'http://www.enigmagroup.org/missions/programming/6/submit.php';
$mech->post( $submit, [ anagram => join(',', @res), submit => 'true' ] );
$mech->save_content( 'abc.html' );

