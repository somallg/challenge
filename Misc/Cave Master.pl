print "bac";
use WWW::Mechanize;
# nekotam #

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

print "Log in";
my $m = WWW::Mechanize->new();
$m->add_header(Cookie => 'phpbb2mysql_sid=bb21806c485d6907a6474ee48a9ab38f');
$m->get('http://www.hacker.org/challenge/misc/d/cave.php');
my @nbAttack;

while(1) {
	my ($title) = $m->content =~ m/\<h2\>(.+)\<\/h2\>/;
	my ($move) = $m->content =~ m/Time underground: (\d+)/;
	my ($dungeonLevel) = $title =~ m/Dungeon Level (\d+)/;

	my ($level, $hp, $xp, $weapon) = $m->content =~ m/\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>/;

	print $title;

	print "Time underground: ", $move;
	print "level ", $level, "\tHP : ", $hp, "\tXP : ", $xp, "\tWeapon : ", $weapon;

	# Encounter big monster #
	my $encounter = 1;
	my $nbAttack = 0;
	while ($m->content =~ m/Big monster/) {
		print "Encounter big monster" if $encounter;
		$encounter = 0;
		my ($levelB, $hpB, $xpB, $weaponB) = $m->content =~ m/\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>\<td\>(.+)\<\/td\>/;
		print "HP " ,$hpB;

		# Use potion if HP < 50% #
		if (int(($hpB/$hp) * 100) <= 25) {
            print "Low HP";
			if ($m->content =~ m/Aquamarine/) {
				print "Use Aquamarine potion";
				$m->follow_link(text_regex => qr/Aquamarine/);
			}
		}

		# Drop useless potion #
		if ($m->content =~ m/Magenta/) {
			print "Use Magenta potion";
			$m->follow_link(text_regex => qr/Magenta/);
		}

		if ($m->content =~ m/Turquoise/) {
			print "Use Turquoise potion";
			$m->follow_link(text_regex => qr/Turquoise/);
		}

		if ($m->content =~ m/Lavender/) {
			print "Use Lavender potion";
			$m->follow_link(text_regex => qr/Lavender/);
		}

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
			my ($currentWeaponLevel, $currentWeapon, $currentDmg) = $m->content =~ m/Level\s+(\d+)\s+(\w+)\s+\+?(\d+)?/;
			my ($newWeaponLevel, $newWeapon, $newDmg) = $m->content =~ m/tres=1">Level\s+(\d+)\s+(\w+)\s+\+?(\d+)?/;
			print "Loot weapon : Level " , $newWeaponLevel, " ", $newWeapon, " ", $newDmg;
			if ($newWeaponLevel > $currentWeaponLevel) {
				print "Pick up Level ", $newWeaponLevel, " ", $newWeapon, " ", $newDmg;
				$m->get('http://www.hacker.org/challenge/misc/d/cave.php?tres=1');
			}

			$newDmg = 0 unless defined($newDmg);
			$currentDmg = 0 unless defined($currentDmg);

			if (($newWeapon == $currentWeapon) && ($newDmg >= $currentDmg)) {
				print "Pick up Level ", $newWeaponLevel, " ", $newWeapon, " ", $newDmg;
				$m->get('http://www.hacker.org/challenge/misc/d/cave.php?tres=1');
			}
		}

		# Pick potion #
		if ($m->content =~ m/potion\.jpg/) {
			my ($potion) = $m->content =~ m/tres=1">(.+?)<\/a>/;
			#if ($potion =~ m/Aquamarine/) {
			print "Pick up ", $potion;
			$m->get('http://www.hacker.org/challenge/misc/d/cave.php?tres=1');
			#}
		}
	}

	if (($m->content =~ m/Down/) && ($level >= ($dungeonLevel + 1))) {
		print "Down Stairs, Go [y/n]?";
		#my $input = <>;
		#chomp($input);
		#if ($input eq "y") {
		$m->get('http://www.hacker.org/challenge/misc/d/cave.php?m=d');
		#}
	}

	#if (scalar(@nbAttack) >= 10) {
	#	@nbAttack = ();
	#}

	# If death try again #
	if ($m->content =~ m/You have died/) {
		print "You have died. Retry";
		$m->get('http://www.hacker.org/challenge/misc/d/cave.php');
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
