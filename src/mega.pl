use strict;
use warnings;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
my $mega = "http://www.megaupload.com/";

# Login to MU for cookiejar #
$mech->get("http://www.megaupload.com/");
$mech->follow_link(text => 'Login');
$mech->submit_form(
 					form_number => 2,
   					fields => {
   						username => 'hadesllg',
   						password => 'linhchi',
	    		   	}
				   	);      
my $url = "http://www.megaupload.com/?d=TYXCC29T";

$mech->get($url);

$mech->follow_link(url_regex => qr/files/);

open(FILE, ">", "Boing_Boing_Teacher_mech_bin.rar");
binmode(FILE);

print FILE $mech->content;

close(FILE);

