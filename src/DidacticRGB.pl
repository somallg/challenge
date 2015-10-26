use GD;

my $im = GD::Image->new("didactrgb.png") or die($!);
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

print($r, $g, $b);

my $rb =  unpack("B32", pack("N", $r));
my $gb =  unpack("B32", pack("N", $g));
my $bb =  unpack("B32", pack("N", $b));
$rb = substr($rb, -8, 8);
$gb = substr($gb, -8, 8);
$bb = substr($bb, -8, 8);

print unpack("N", pack("B32", ("0"x8) . $rb . $gb . $bb));
