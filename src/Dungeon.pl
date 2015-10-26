use WWW::Mechanize;

sub random {
	my $n = int(rand(4));
	return "North" if $n == 0;
	return "East" if $n == 1;
	return "South" if $n == 2;
	return "West" if $n == 3;
}

sub canGoDown {
	my @nbAttack = @_;
	return 0 if (scalar(@nbAttack) < 10);

	foreach (@nbAttack) {
		return 0 if $_ > 3;
	}

	return 1;
}

my $m = WWW::Mechanize->new();

$m->add_header(Cookie => 'phpbb2mysql_sid=2e47b66c3aa3959f26e1db33471bc215');

$m->get('http://www.hacker.org/challenge/misc/d/index.php');
open(FILE, ">", "Dungeon.log");
my @nbAttack;

while(1) {
	if ($m->content =~ m/A monster blocks/) {
		print FILE $m->content;
	}
		  
	my ($title) = $m->content =~ m/\<h2\>(.+)\<\/h2\>/;
	my ($dungeonLevel) = $title =~ m/Dungeon Level (\d+)/;

	my ($level, $hp, $xp, $weapon) = $m->content =~ m/\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>/;

	print $title;

	print "level ", $level, "\tHP : ", $hp, "\tXP : ", $xp, "\tWeapon : ", $weapon;

	# Encounter big monster #
	my $encounter = 1;
	my $nbAttack = 0;
	while ($m->content =~ m/Big monster/) {
		print "Encounter big monster" if $encounter;
		$encounter = 0;
		($level, $hp, $xp, $weapon) = $m->content =~ m/\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>/;
		print "HP " ,$hp;
		#if ($hp < 100) {
		#	$m->follow_link(text_regex => qr/Aquamarine/i);
		#}
		$m->follow_link(text => 'Attack!');
		print "Attack !";
		#$nbAttack++;
		#push(@nbAttack, $nbAttack);
	}

	# Loot #
	if ($m->content =~ m/Pick up treasure/) {
		print "Pick up treasure";
		# If loot is a weapon #
		if ($m->content =~ m/sword/) {
			my ($currentWeapon, $currentDmg) = $m->content =~ m/Level\s+(\d+)\s+\w+(\d+)?/;
			my ($newWeapon, $newDmg) = $m->content =~ m/tres=1">Level\s+(\d+)\s+\w+\s+\+(\d+)?/;
			if ($newWeapon > $currentWeapon) {
				print "Pick up ", $currentWeapon, " ", $currentDmg;
				$m->get('http://www.hacker.org/challenge/misc/d/index.php?tres=1');
			}

			$currentDmg = 0 unless defined($currentDmg);
			$newDmg = 0 unless defined($newDmg);

			if (($newWeapon == $currentWeapon) && ($newDmg > $currentDmg)) {
				print "Pick up ", $currentWeapon, " ", $currentDmg;
				$m->get('http://www.hacker.org/challenge/misc/d/index.php?tres=1');
			}
		}

		if ($m->content =~ m/potion\.jpg/) {
			my ($potion) = $m->content =~ m/tres=1">(.+?)<\/a>/;
			if ($potion =~ m/Aquamarine/) {
				print "Pick up ", $potion;
				$m->get('http://www.hacker.org/challenge/misc/d/index.php?tres=1');
			}
		}
	}

	if (($m->content =~ m/Down/) && ($level >= ($dungeonLevel + 5))) {
		print "Down Stairs, Go [y/n]?";
		#my $input = <>;
		#chomp($input);
		#if ($input eq "y") {
		$m->get('http://www.hacker.org/challenge/misc/d/index.php?m=d');
		#}
	}

	#if (scalar(@nbAttack) >= 10) {
	#	@nbAttack = ();
	#}

	# If death try again #
	if ($m->content =~ m/You have died/) {
		print "You have died. Retry";
		$m->get('http://www.hacker.org/challenge/misc/d/index.php');
		next;
	}
	# Moving #
	while(my $direc = random()) {
		#print $direc;
		if ($m->content =~ m/$direc/) {
			print "Go ", $direc;
			$m->follow_link( text => $direc);
			last;
		}
	}
	#sleep(1);
}
