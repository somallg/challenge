use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
$mech->add_header(Cookie => 'PHPSESSID=cf4a0550578a80c3f7307816125d8c1b');
$mech->get("http://www.bright-shadows.net/challenges/programming/xor/tryout.php");
my ($text) = $mech->content =~ m/\'(.+)\'$/;
my $xor = "C12W4BERT954";
$xor = $xor x 3;
print $text, " ",length($text);
print $xor, " ",length($xor);
my $xored = substr($xor ^ $text, 0, length($text));
print $xored;
$mech->get("http://www.bright-shadows.net/challenges/programming/xor/solution.php?solution=" . $xored);
print $mech->content;
#print Dumper($mech);
