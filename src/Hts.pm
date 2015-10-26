# ---- Fichier Hts.pm ---- #
package Hts;

use strict;
use warnings;

use WWW::Mechanize;
use GD;

# Class contructor
sub new {
	my $class = shift;
	my $this = {};
	bless($this, $class);
	return $this;
}

# Mission 01 Method
# Calcul the sum of a string for Mission 01
sub sum01 {
	my ($para) = @_;
	my $sum = 0;
	
	foreach my $ascval (unpack("C*", $para)) {
		$sum += $ascval ** 3;
	}
	
	return $sum;
}

# Get agent object created when login
sub getMech {
	my $this = shift;
	return $this->{mech};
}

# Load wordlist for Mission 01
sub chargerWordList {
	my ($this) = shift;
	$this->{wordlist} = [];
	open(WORDLIST, "<" , "wordlist.txt") or die("Problem sur wordlist.txt\n");

	my $ligne;
	while ($ligne = <WORDLIST>) {
		chomp($ligne);
		push(@{$this->{wordlist}}, $ligne);
	}
}

# Go to Mission 01 and gathering scramble list
sub chargerList {
	my $this = shift;
	my $mech = $this->{mech};

	$mech->follow_link(text => "Programming missions", n => 1);
	$mech->follow_link(text => "Take this challenge!", n => 1);

	# Fetching page
	my $output_page = $mech->content();
	# Looking for scamble list
	$this->{list} = [];
	while ($output_page =~ /<td><li>(.*)<\/li\><\/td>/g) {
		push(@{$this->{list}}, $1);
	}
}

# Looking for unscamble words in Wordlist
sub solveMission01 {
	my $this = shift;
	my @res = ();
	foreach my $i (@{$this->{list}}) {
		foreach my $j (@{$this->{wordlist}}) {
			if (sum01($i) == sum01($j)) {
				push(@res, $j);
				last;
			}
		}
	}

	# Building solution
	my $aux = join(',', @res);
	# Remove the last ',' at the end of the string
	substr($aux, -1, 1) = "";
	print("$aux");

	$this->{res} = $aux;
} 

# Mission 02 Method
###################################################################
sub init 

# Go to Mission 12 and gathering the string
sub chargerString {
	my $this = shift;
	my $mech = $this->{mech};

	$mech->follow_link(text => "Programming missions", n => 1);
	$mech->follow_link(text => "Take this challenge!", n => 12);

	# Fetching page
	my $output_page = $mech->content();
	print $output_page;
	$output_page =~ /type="text" value="(.*)"/;
   		$this->{string} = $1;
}

# Mission 12 get composite number and prime number
sub solveMission12 {
	my $this = shift;
	my $chaine = $this->{string};
	$this->{composite} = [];
	$this->{prime} = [];

	# Look for all digit number and classify them in 2 tables
	while ($chaine =~ /(\d)/g) {
		next if (($1 == 1) || ($1 == 0));

		if (($1 % 2 == 0) && ($1 > 2)) {
			push(@{$this->{composite}}, $1);
			next;
		}

		if (($1 % 3 == 0) && ($1 > 3)) {
			push(@{$this->{composite}}, $1);
			next;
        }

	   push(@{$this->{prime}}, $1);
	}

	# Take the 25 frist non-numeric characters
	my $i = 0;
	$this->{res} = "";
	while ($chaine =~ /([^\d])/g) {
		if ($i < 25) {
			my $j = ord($1);
			$j++;
            $this->{res} .= chr($j);
			$i++;
		} else {
			last;
		}
	}


	# Adding sum of primes and composites numbers
	my $sumComposite = 0;
	map({$sumComposite += $_} @{$this->{composite}});
	my $sumPrime = 0;
	map({$sumPrime += $_} @{$this->{prime}});

	# Append the sum below to res
	$this->{res} .= ($sumComposite * $sumPrime);
}

# General method
# Login to HTS main page and return agent object created
sub loginHTS {
	my ($this) = shift;

	# Login username and password
	my $url = "http://www.hackthissite.org";
	my $username = "ioio09";
	my $password = "pam382jam";

	#Create an agent to connect to HTS
	my $mech = WWW::Mechanize->new();
	$mech->get($url);
	$mech->form_number(1);
	$mech->field(username => $username);
	$mech->field(password => $password);
	$mech->click();
	
    # After this we have connected to HTS
	$this->{mech} = $mech;
}
  
# Submit resolution 
# Attention you have to be at the right page
sub submitHTS {
	my $this = shift;
	my $mech = $this->{mech};

	# Submit solution to HTS
	$mech->dump_forms();
	$mech->form_number(1);
	$mech->field(solution => $this->{res});
	$mech->click();
	$this->{mech} = $mech;
}

1;
__END__
