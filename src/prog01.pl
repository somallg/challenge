use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
$mech->add_header(Cookie => 'PHPSESSID=7429d3ac0af56e4eca3ae701dab979ac');
$mech->get("http://www.bright-shadows.net/challenges/programming/get_started/tryout.php");
my ($str) = $mech->content =~ m/\'(.+)\'/;
$mech->get("http://www.bright-shadows.net/challenges/programming/get_started/solution.php?solution=" . $str);
print $mech->content;
#print Dumper($mech);
