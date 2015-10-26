use threads;
use strict;
use warnings;
use integer;
use Digest::MD5 qw(md5 md5_hex md5_base64);
use Benchmark;


#timethis(1, "main");
#timethis(1, "
# Load encryptedText 
open(TXT, "<", "output") or die($!);
my $encryptedText = <TXT>;
close(TXT);

# Variables 
my @encryptedText = split(/ /, $encryptedText);
my @hexChars = (0..9, "a".."f");
my %hexChars;
my @arrChar = (0..9, "A".."Z");
my %arrChar;

foreach (@hexChars) {
	$hexChars{$_} = $_ . "";
}

# List for 3 chars
my @combo = ();
foreach my $x (@arrChar) {
	foreach my $y (@arrChar) {
		foreach my $z (@arrChar) {
			#print $word;
			push(@combo, $x . $y . $z . "-");
		}
	}
}


########################################
## main 							####
########################################
our $md5Init = 200;
my @pid;

### fork version #########
#for (my $i = 0; $i < 99; $i++) {
#	my $pid = fork();
#	if ($pid) {
#		push(@pid, $pid);
#	} elsif (! $pid) {
#		if (decryptCle2($md5Init + $i) == 0) {
#			exit(1);
#		} else {
#			exit(1);
#		}
#	} else {
#		die($!);
#	}
#
#	}

#foreach (@pid) {
#	waitpid($_, 0);
#}
############################################
## thread version ###

my @threads;

for my $i (0..99) {
	my $t = threads->create(\&decryptCle2, $md5Init + $i);
	push(@threads, $t);
}

foreach(@threads) {
	if ($_->join() == 1) {
		foreach my $t (@threads) {
           $t->detach();
		}
	}
}

print "End of main";

########################################
## return the md5hash of strPassword  ##
########################################
sub decryptHash {
	my ($md5Init, @tmp) = @_;
	my $strPasswordMD5;  
	my $clepossible;
	my @arrHex;
	my $strString;

	foreach my $cle (@tmp) {
		$clepossible = 1;
		@arrHex = ();
		my $intMD5Total = $md5Init;
		for (my $i = 0; $i < length($cle); $i++) {
			my $hex = $encryptedText[$i] + $intMD5Total - ord(substr($cle, $i ,1));
			$hex = sprintf("%x", $hex);

			if (defined($arrHex[$i%32]) && ($hex ne $arrHex[$i%32])) {
				print "Cle impossible", $cle;
				$clepossible = 0;
				last;
			}

			if (!defined($arrHex[$i%32])) {
				$arrHex[$i%32] = $hex;
			}

			$intMD5Total = evalCrossTotal(substr(md5_hex(substr($cle, 0, $i+1)), 0, 16)
										. substr(md5_hex($intMD5Total), 0, 16));
		}

		if ($clepossible) {
			print "Cle possible";
			print $cle;
			$strString = $cle;
			$strPasswordMD5 = join("", @arrHex);
			print $strPasswordMD5;
		}

	return $strPasswordMD5;
	}
}

########################################
# Decrypt cle from md5hash of strPass ##
########################################
sub decryptCleTotal {
	my $strPasswordMD5 = shift;
	my $intMD5Total = evalCrossTotal($strPasswordMD5);
	my @strString = ();
	for (my $i = 0; $i < scalar(@encryptedText); $i++){
		$strString[$i] = chr($encryptedText[$i] + $intMD5Total - hex(substr($strPasswordMD5, $i%32,1)));
		my $char = join("", @strString);
		$intMD5Total = evalCrossTotal(substr(md5_hex(substr($char, 0, $i+1)), 0, 16)
									. substr(md5_hex($intMD5Total), 0, 16));
	}
	print join("", @strString);   
}
########################################
### evalCrossTotal					####
########################################
sub evalCrossTotal {
	my ($strMD5) = @_;
	my $intTotal = 0;
	my @arrMD5Chars = split(//, $strMD5);

	foreach (@arrMD5Chars) {
		$intTotal += hex('0x0' . $_);
	}

	return $intTotal;
}  

########################################
### Decrypt cle from md5init         ###
########################################
sub decryptCle {
	my $md5Init = shift;
	my @tmp = ("");
	my %intMD5;
	$intMD5{""} = $md5Init;
	print("Test cle \$md5Init = ", $md5Init);

	my $index = 0;
	while (1) {
	my	@tmp2 = ();
	foreach my $cle (@tmp) {
		foreach my $char (@combo) {
			my $intMD5Total = $intMD5{$cle};
			my $strString = $cle . $char;

			if (($index == 1) || ($index == 4)) {
			$strString .= "OEM-";
			}

			if ($index == 3) {
				$strString = $cle ."1.1\n" . $char;
			}
			if ($index == 5) {
				$strString .= "1.1\n";
			}

			my $intStrlen = length($strString);
			for (my $i = length($cle); $i < $intStrlen; $i++) { 
				my $hex = $encryptedText[$i] + $intMD5Total - ord(substr($strString, $i, 1));
				$hex = sprintf("%x", $hex);

				unless (exists($hexChars{$hex})) {
					last;
				}

				#if (!exists($md5sum{substr($strString, 0, $i+1)})) {
				#	$md5sum{substr($strString, 0, $i+1)} = md5_hex(substr($strString, 0, $i+1));
				#}

				#if (!exists($md5sum{$intMD5Total})) {
				#	$md5sum{$intMD5Total} = md5_hex($intMD5Total);
				#}

				$intMD5Total = evalCrossTotal(substr(md5_hex(substr($strString, 0, $i+1)), 0, 16)
											. substr(md5_hex($intMD5Total), 0, 16));
				if ($i == ($intStrlen - 1)) {
					push(@tmp2, $strString);
					$intMD5{$strString} = $intMD5Total;
				}
			}
		}
	}

	@tmp = ();
	@tmp = @tmp2;
	if (scalar(@tmp) == 0) { 
		print "Cle impossible with ", $md5Init;
		return 0;
	}

	#if ($index == 0 && scalar(@tmp) < 10) {
	#	print "Cle impossible with ", $md5Init;
	#	return 0;
	#}

	if ($index == 5) {
		print "Cle trouve \$md5Init = ", $md5Init;
		print foreach (@tmp);
		print scalar(@tmp);
		last;
	}
	print "\$md5Init = ", $md5Init, " \$index = ", $index, " => ", scalar(@tmp); 

	$index++;
	}

	# out of while block #
	my $strPasswordMD5 = decryptHash($md5Init, @tmp);
	decryptCleTotal($strPasswordMD5);
	return 1;
}

sub decryptCle2 {
	my $md5Init = shift;
	my @tmp = ("");
	my %intMD5;
	$intMD5{""} = $md5Init;
	#print("Test cle \$md5Init = ", $md5Init);

	my $index = 0;
	while (1) {
	my	@tmp2 = ();
	foreach my $cle (@tmp) {
		foreach my $char (@arrChar) {
			my $intMD5Total = $intMD5{$cle};
			my $strString = $cle . $char;

			if (($index == 2) || ($index == 11) || ($index == 20) || ($index == 29) || ($index == 38)) {
				$strString .= "-";
			}

			if (($index == 5) || ($index == 14) || ($index == 23) || ($index == 32) || ($index == 41)) {
				$strString .= "-OEM-";
			}

			if (($index == 8) || ($index == 17)|| ($index == 26) || ($index == 35) || ($index == 44)) {
				$strString .= "-1.1\n";
			}
				
			my $intStrlen = length($strString);
			for (my $i = length($cle); $i < $intStrlen; $i++) { 
				my $hex = $encryptedText[$i] + $intMD5Total - ord(substr($strString, $i, 1));
				$hex = sprintf("%x", $hex);

				unless (exists($hexChars{$hex})) {
					last;
				}

				#if (!exists($md5sum{substr($strString, 0, $i+1)})) {
				#	$md5sum{substr($strString, 0, $i+1)} = md5_hex(substr($strString, 0, $i+1));
				#}

				#if (!exists($md5sum{$intMD5Total})) {
				#	$md5sum{$intMD5Total} = md5_hex($intMD5Total);
				#}

				$intMD5Total = evalCrossTotal(substr(md5_hex(substr($strString, 0, $i+1)), 0, 16)
											. substr(md5_hex($intMD5Total), 0, 16));
				if ($i == ($intStrlen - 1)) {
					push(@tmp2, $strString);
					$intMD5{$strString} = $intMD5Total;
				}
			}
		}
	}

	@tmp = ();
	@tmp = @tmp2;
	if (scalar(@tmp) == 0) { 
		print "Cle impossible with ", $md5Init;
		return 0;
	}

	#if ($index == 0 && scalar(@tmp) < 10) {
	#	print "Cle impossible with ", $md5Init;
	#	return 0;
	#}

	if ($index == 44) {
		print "Cle trouve \$md5Init = ", $md5Init;
		print foreach (@tmp);
		last;
	}

	#if ($index == 17) {
	#	print "Cle trouve \$md5Init = ", $md5Init;
	#	print foreach (@tmp);
	#	print scalar(@tmp);
	#	last;
	#}
	print "\$md5Init = ", $md5Init, " \$index = ", $index, " => ", scalar(@tmp); 

	$index++;
	}

	# out of while block #
	#my $strPasswordMD5 = decryptHash($md5Init, @tmp);
	#decryptCleTotal($strPasswordMD5);
	return 1;
}   

          
