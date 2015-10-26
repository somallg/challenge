use strict;
use warnings;

use HackerOrg;
use Data::Dumper;

my $user = 'Khoaito';
my $pass = 'noob123noob';

my $h = HackerOrg->new( $user, $pass );
my $url = "http://www.hacker.org/runaway/index.php";
my $m = $h->{mech};

while (1) {
    my (
        $FlashVars, $FVinsMax, $FVinsMin, $FVboardX, $FVboardY,
        $FVlevel,   $board,    $terrain,  $tmp
    );

    # get content #
    $m->get($url);

    ($FlashVars) = $m->content =~ m/FlashVars="(.*?)"/;

    ( $FVinsMax, $FVinsMin, $FVboardX, $FVboardY, $FVlevel ) = $FlashVars =~
m/\&FVinsMax=(\d+)\&FVinsMin=(\d+)\&FVboardX=(\d+)\&FVboardY=(\d+)\&FVlevel=(\d+)$/;

    ($board) = $FlashVars =~ m/FVterrainString=(.*?)\&/;

    print "Level : ", $FVlevel, "\n";
    print "FVinsMin : ", $FVinsMin, "\tFVinsMax : ", $FVinsMax,
        "\tFVboardX : ", $FVboardX, "\tFVboardY : ", $FVboardY, "\n";

    open( FILE, '>', 'run.data' ) or die($!);
    $board =~ s/\./_/g;
    print FILE $board,    "\n";
    print FILE $FVinsMax, "\n";
    print FILE $FVinsMin, "\n";
    print FILE $FVboardX, "\n";
    close(FILE);
    system('python RunawayRobotter.py');
    open( FILE, '<', 'run.res' ) or die($!);
    my $res = <FILE>;
    print "Path found : ", $res,      "\t.Submit lvl !\n\n";
    print "Level : ",      $FVlevel,  "\n";
    print "FVinsMin : ",   $FVinsMin, "\tFVinsMax : ", $FVinsMax,
        "\tFVboardX : ", $FVboardX, "\tFVboardY : ", $FVboardY, "\n";

    #$m->get( $url . '?name=' . $user . '&password=' . $pass . '&path=' . $res );
    $m->get( $url . '?path=' . $res );
}
