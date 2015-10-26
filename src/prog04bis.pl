use WWW::Mechanize;
use GD;

my $im = GD::Image->new('rankkix.gif');
print $im->height;
print $im->width;
my $black = $im->colorAllocate(0,0,0);
my $index;
my ($r, $g, $b);
for (my $i = 0; $i < $im->width; $i++) {
	for (my $j = 0; $j < $im->height; $j++) {
	    $index = $im->getPixel($i, $j);
        ($r, $g, $b) = $im->rgb($index);
		print $r, $g, $b;
	 #   if (($r != 255) or ($g != 255) or ($b != 255)) {
	 #   	$im->setPixel($i,$j,$black);
	 #   }
	}
}

#print $im->gif;

