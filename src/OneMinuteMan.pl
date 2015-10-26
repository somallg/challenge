#!/usr/bin/perl -l
use WWW::Mechanize;

my $m = WWW::Mechanize->new();
$m->add_header(Cookie => 'phpbb2mysql_sid=8bce0d66ca5d825822490efafbd6376e');
my $i;
#open(FILE, ">", "OneMinuteMan.log") or die($!);
while(1) {
	$m->get('http://www.hacker.org/challenge/misc/minuteman.php');
	print $m->content and die() unless ($m->content =~ m/back later/);
	print $i++, "  ",$m->content;
	sleep(10);
}
