use strict;
use warnings;

use Data::Dumper;
use XML::Simple;
use GD;
use POSIX;

# Create new parser
my $parser = XML::Simple->new(KeepRoot => 1);

# Load xml file
my $doc = $parser->XMLin('plotMe.xml');

# Create new image
my $im = GD::Image->new(1000,1000);

# Allocate some colors
my $white = $im->colorAllocate(255,255,255);
my $yellow = $im->colorAllocate(255,255,0);
my $red = $im->colorAllocate(255,0,0);
my $green = $im->colorAllocate(0,255,0);
my $blue = $im->colorAllocate(0,0,255);
my $black = $im->colorAllocate(0,0,0);
$im->fill(0,0,$black);

# Draw lines

#$im->line(0,1000 - 0, 200,1000 - 200, $white);
#$im->line(0, 1000 - 200, 200, 1000 - 2000, $white);
#$im->arc(1000,1000, 1000 - 100,1000 - 100, 10,80, $white);
#$im->arc(200, 1000 - 200, 200, 200, 10 - (2 * 10 + 80) , (80 + 10) - (10 * 2 + 80), $white);
#$im->arc(275,1000-140,34*2,34*2,187 - (187 * 2 + 180) ,187 + 180 - (187 *2 + 180) ,$white);


my $iter;
foreach my $line (@{$doc->{ppcPlot}->{Line}}) {
	$iter++;
	unless (defined($line->{Color})) {   
		$im->line($line->{XStart}, 1000 - $line->{YStart}, $line->{XEnd}, 1000 - $line->{YEnd}, $white);
		next;
	}

	if (($line->{Color} eq "yellow")) {
		$im->line($line->{XStart} , 1000 - $line->{YStart}, $line->{XEnd} , 1000 - $line->{YEnd}, $yellow); 
		next;
	}

	if (($line->{Color} eq "red")) {
		$im->line($line->{XStart} , 1000 - $line->{YStart} , $line->{XEnd} , 1000 - $line->{YEnd} , $red); 
		next;
	}

	if (($line->{Color} eq "green")) {
		$im->line($line->{XStart} , 1000 - $line->{YStart} , $line->{XEnd} , 1000 - $line->{YEnd} , $green); 
		next;
	}

	if (($line->{Color} eq "blue")) {
		$im->line($line->{XStart} , 1000 - $line->{YStart} , $line->{XEnd} , 1000 - $line->{YEnd} , $blue); 
		next;
	}

}

# Draw arcs
my ($start, $end);
foreach my $line (@{$doc->{ppcPlot}->{Arc}}) {
    $start = $line->{ArcStart} - ($line->{ArcStart} * 2 + $line->{ArcExtend});
	$end = $line->{ArcStart} + $line->{ArcExtend} - ($line->{ArcStart} * 2 + $line->{ArcExtend});


	unless (defined($line->{Color})) {
		$im->arc($line->{XCenter}, 1000 - $line->{YCenter}, $line->{Radius} * 2 , $line->{Radius} * 2,  $start, $end, $white); 
		next;
	}

	if (($line->{Color} eq "yellow")) {
		$im->arc($line->{XCenter}, 1000 - $line->{YCenter}, $line->{Radius}  * 2, $line->{Radius} * 2,  $start, $end, $yellow); 
	}

    if (($line->{Color} eq "red")) {
		$im->arc($line->{XCenter}, 1000 - $line->{YCenter}, $line->{Radius}  * 2, $line->{Radius} * 2,  $start, $end , $red); 
	} 

    if (($line->{Color} eq "green")) {
		$im->arc($line->{XCenter}, 1000 - $line->{YCenter}, $line->{Radius}  * 2, $line->{Radius} * 2,  $start, $end , $green); 
	} 


    if (($line->{Color} eq "blue")) {
		$im->arc($line->{XCenter}, 1000 - $line->{YCenter}, $line->{Radius}  * 2, $line->{Radius}  * 2, $start, $end , $blue); 
		next;
	} 

  
	#$im->arc(ceil(ceil($line->{XCenter})), ceil(ceil($line->{YCenter})), ceil(ceil($line->{Radius})), ceil($line->{Radius}), ceil(ceil()), ceil(), $line->{Color}) if (defined($line->{Color}));
}

open(PNG, ">", "resu.png") or die();

binmode(PNG);

print(PNG $im->png);
close(PNG);

print($iter);


