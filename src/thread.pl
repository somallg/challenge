use threads;
use strict;
use warnings;
use Digest::MD5 qw(md5_hex);

sub sub1 {
	my $i = 0;
	while (1) {
	print "Thread 01", " ", md5_hex($i++);
	}
}

sub sub2 {
	my $i = 0;
	while (1) {
	print "\tThread 02", " ", md5_hex($i++);
	}
}

sub sub3 {
	my $i = 0;
	while (1) {
	print "Thread 03", " ", md5_hex($i++);
	}
}

my @arrThread;

$arrThread[0] = threads->create(\&sub1);
$arrThread[1] = threads->create(\&sub2);
$arrThread[2] = threads->create(\&sub3);

$arrThread[0]->join();
$arrThread[1]->join();
$arrThread[2]->join();

