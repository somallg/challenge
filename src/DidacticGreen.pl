use GD;

GD::Image->trueColor(1);
my $im = GD::Image->new("greenline.png") or die($!);
#print $im->width, " ", $im->height;
my ($r, $g, $b);
my $index;
for (my $i = 0; $i < $im->width; $i++) {
	for (my $j = 0; $j < $im->height; $j++) {
		$index = $im->getPixel($j,$i);
		($r, $g, $b) = $im->rgb($index);
		print chr($g);
	}
}

