use strict;
use warnings;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

my $url = "http://www.wechall.net";

$mech->get($url);

$mech->set_fields(
					username => "somallg",
					password => "090786",
					);
$mech->click();

$mech->follow_link(text => 'Challenges', n => 1);

$mech->follow_link(text => 'Training: Programming 1', n => 1);

my $answer = "http://www.wechall.net/challenge/training/programming1/index.php?answer=";

$mech->follow_link(text => 'this link', n => 1);

my ($code) = $mech->content =~ m/\>\n(.+)$/;

$answer .= $code;

$mech->get($answer);



