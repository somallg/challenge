use strict;
use strict;
use warnings;

use WWW::Mechanize;
use HTML::Parser ();
use Data::Dumper;
use PDL;
use PDL::Matrix;
use integer;

my $game  = 0;
my $tag_b = 0;
my ( $a, $b ) = ();
my (%shapes);

sub start_handler {
    my ( $tagname, $attr ) = @_;
    $game = 1
      if $tagname eq 'table'
          and exists $attr->{id}
          and $attr->{id} eq 'game_grid';

    if ( $tagname eq 'img' ) {
        my ($shape) = $attr->{src} =~ m/shapes\/(.*)\.png/;
        $shapes{$shape}++ if defined $shape;
    }

    $tag_b = 1 if $tagname eq 'strong';

    return unless $game;
}

sub end_handler {
    my $tagname = shift;
    $game = 0 if $game and $tagname eq 'table';
    return unless $game;
    if ( $tagname eq 'tr' ) {
        my $tmp = [];
        foreach (qw/circle heart square triangle star/) {
            push @$tmp, exists $shapes{$_} ? $shapes{$_} : 0;
        }
        push @$a, $tmp;
        %shapes = ();
    }
}

sub text_handler {
    return unless $game;
    my $text = shift;
    $text =~ s/\n//g;
    $text =~ s/\s*//g;
    return unless $text;
    return unless $text =~ m/(\d)+/;
    push @$b, $text;
}

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

my $url = 'http://www.enigmagroup.org/missions/programming/9/index.php';
$mech->get($url);

my $p = HTML::Parser->new(
    api_version => 3,
    start_h     => [ \&start_handler, "tagname, attr" ],
    end_h       => [ \&end_handler, "tagname" ],
    text_h      => [ \&text_handler, "text" ]
);

$p->parse( $mech->content );

@$a = splice @$a, 0, 5;
@$b = splice @$b, 0, 5;
my $ma = mpdl $a;
my $mb = mpdl $b;
my $x  = $ma->inv x $mb->transpose;

$mech->form_number(1);
$mech->set_fields(
    circle   => $x->at( 0, 0 ),
    heart    => $x->at( 1, 0 ),
    square   => $x->at( 2, 0 ),
    triangle => $x->at( 3, 0 ),
    star     => $x->at( 4, 0 )
);
$mech->click( 'submit' );

$mech->save_content('abc.html');
