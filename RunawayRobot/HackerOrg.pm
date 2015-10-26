use strict;
use warnings;
package HackerOrg;

use WWW::Mechanize;
use HTTP::Cookies;

sub new {
    my ( $pkg, $user, $pass ) = @_;

    # cookie jar
    my $cj = HTTP::Cookies->new(
    #    file     => 'hacker.org.cj',
    #    autosave => 1,
    );

    # browser
    my $mech = WWW::Mechanize->new();
    $mech->add_header(Cookie => 'phpbb2mysql_sid=e4da84ec12186d0661b75716713e0bfa');
    #$mech->show_progress(1);

    #unless ( -e 'hacker.org.cj' ) {
    #    my $login = 'http://www.hacker.org/forum/login.php';
    #    $mech->get($login);

    #    $mech->dump_forms;
    #    $mech->submit_form(
            #form_number => 1,
    #        fields      => {
    #            username => $user,
    #            password => $pass
    #        }
    #    );
    #}

    my $self = { mech => $mech };
    bless $self, $pkg;

    return $self;
}

1;

