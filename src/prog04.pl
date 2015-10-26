use WWW::Mechanize;
use GD;

my $mech = WWW::Mechanize->new();
$mech->add_header(Cookie => 'PHPSESSID=42d52c93cd75db337a3b963cafaf5fe2');
$mech->get("http://www.bright-shadows.net/challenges/programming/numbers/tryout.php");
my $im = GD::Image->new($mech->content);
print $im->width, " ", $im->height;
my $black = $im->colorAllocate(0,0,0);
my ($r, $g, $b);
my $index;
for (my $i = 0; $i < $im->width; $i++) {
	for (my $j = 0; $j < $im->height; $j++) {
		$index = $im->getPixel($i,$j);
		($r, $g, $b) = $im->rgb($index);
		$im->setPixel($i,$j,$black) if ($g != 200);
	}
}
open(FILE, ">", "prog04.png");
binmode(FILE);
print FILE $im->png;
close(FILE);
system('feh prog04.png');
my $n = <>;
chomp($n);
#print $n;
$mech->get("http://www.bright-shadows.net/challenges/programming/numbers/solution.php?solution=" . $n);
print $mech->content;
#print $mech->content;
#print Dumper($mech);
