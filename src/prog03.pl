use WWW::Mechanize;
use Convert::Morse qw(as_ascii);

my $mech = WWW::Mechanize->new();
$mech->add_header(Cookie => 'PHPSESSID=cf4a0550578a80c3f7307816125d8c1b');
$mech->get("http://www.bright-shadows.net/challenges/programming/dit_dit_dah/tryout.php");
my ($text) = $mech->content =~ m/\'(.+)\'$/;
print $text;
$text =~ s/0/\-/g;
$text =~ s/1/\./g;
$text =~ s/2/\ /g;
print $text;
print lc as_ascii($text);
$mech->get("http://www.bright-shadows.net/challenges/programming/dit_dit_dah/solution.php?solution=" . (lc as_ascii($text)));
print $mech->content;
#print $mech->content;
#print Dumper($mech);
