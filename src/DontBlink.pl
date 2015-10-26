use WWW::Mechanize;

my $m = WWW::Mechanize->new();
$m->add_header(Cookie => 'phpbb2mysql_sid=6f4b578b18fcc18aa2795ae31faf6bdd'); 

#$m->max_redirect(0);
$m->requests_redirectable([]);
$m->get('http://www.hacker.org/challenge/misc/one.php');
print $m->content;
print $m->dump_headers();
