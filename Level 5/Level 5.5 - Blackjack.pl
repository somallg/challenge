use strict;
use warnings;
use Data::Dumper;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new;

$mech->show_progress(1);
$mech->get('http://www.rankk.org');

$mech->submit_form(
    form_number => 1,
    fields      => {
        username => 'Khoaito',
        passwd   => ''
    }
);

my $lvl = 'http://www.rankk.org/challenges/blackjack.py';
$mech->get($lvl);

$mech->click();

$mech->click('deal');

my ( $data, $dealer, $player, $credits, $nb_hits );
$nb_hits = 0;
$player  = 0;

$mech->show_progress(0);
while (1) {
    $data = $mech->content;
    ( $dealer, $player ) = $data =~ m/Points:\s(\d*)/mg;
    ($credits) = $data =~ m/CREDITS:\s(-?\d*)/mg;
    unless ( defined $player ) {
        #$mech->save_content('abc.html');
        my ( $p1, $p2 ) = $data =~ m/Possible\spoints\s(\d*),\s(\d*)/mg;
        if ( ( $p2 == 21 ) && !$nb_hits ) {
            $mech->click('deal');
            $nb_hits = 0;
        }
        elsif ( ( $p2 > 18 ) && ( $p2 < 22 ) ) {
            $mech->click('stand');
            $mech->click('deal');
            $nb_hits = 0;
        }
        elsif ( ( $p1 == 2 ) && ( $p2 == 12 ) ) {
            $mech->click('deal');
            $nb_hits = 0;
        }
        elsif ( $p1 > 21 ) {
            print "You lose\n";
            $mech->click('deal');
            $nb_hits = 0;
        }
        else {
            $mech->save_content('abc.html');
            print "Soft hit\n";
            $mech->click('hit');
            $nb_hits++;
        }
        print Dumper [ $dealer, $p1, $p2, $credits ];
        next;
    }
    print Dumper [ $dealer, $player, $credits ];

    if ( ( $nb_hits == 3 ) && ( $player < 22 ) ) {
        $mech->click('deal');
        $nb_hits = 0;
        next;
    }

    if ( ( $player > 16 ) && ( $player < 22 ) ) {
        $mech->click('stand');
        $mech->click('deal');
        $nb_hits = 0;
    }
    elsif ( ( $player > 11 ) && ( $player < 17 ) ) {
        if ( $dealer < 7 ) {
            $mech->click('stand');
            $mech->click('deal');
            $nb_hits = 0;
        }
        else {
            print "Hard hit 1\n";
            $mech->click('hit');
            $nb_hits++;
        }
    }
    elsif ( $player > 21 ) {
        print "You lose\n";
        $mech->click('deal');
        $nb_hits = 0;
    }
    else {
        print "Hard hit 2\n";
        $mech->click('hit');
        $nb_hits++;
    }

    #sleep 1;
    $mech->save_content('abc.html')
      if $player > 1000;
    

}

