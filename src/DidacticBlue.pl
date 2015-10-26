use GD;

GD::Image->trueColor(1);
my $im = GD::Image->new("blue.png") or die($!);

my ($r, $g, $b);
my $index;
for (my $i = 0; $i < $im->height; $i++) {
	for (my $j = 0; $j < $im->width; $j++) {
		$index = $im->getPixel($j,$i);
		($r, $g, $b) = $im->rgb($index);
		print chr($b);
	}
	print "\n";
}

