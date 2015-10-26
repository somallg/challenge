use strict;
use warnings;
use Data::Dumper;
use WWW::Mechanize;
use integer;

my $mech = WWW::Mechanize->new;
$mech->show_progress(1);
$mech->agent_alias('Linux Mozilla');
$mech->get('http://www.rankk.org');

$mech->submit_form(
    form_number => 1,
    fields      => {
        username => 'Khoaito',
        passwd   => ''
    }
);

my $lvl = 'http://www.rankk.org/challenges/convert-and-count.py';
$mech->get($lvl);

my ( $data, $i, $j, @data );
($i)    = $mech->content =~ m/at\sposition\s(\d*)/mg;
($data) = $mech->content =~ m/<pre>(.*)<\/pre>/mg;
$data =~ s/<br\s\/>//g;
@data = split( ',', $data );
my $sum = 0;

my $l = 1;
#foreach ( @data ) {
#    $sum += count( convert( $_ ) );
#    print "$l " . $_ . " " . convert( $_ ) . " " . count(convert( $_ ) ) . " sum = $sum\n";
#    $l++;
#}
my $t = "";
foreach (@data) {
    $t .= convert($_);
} 
$sum = count($t);

my $res = $lvl . '?solution=' . $sum . $data[$i-1];

print Dumper $i, $data[$i-1];
print Dumper count( convert(9) . convert(87) . convert(104) );
$mech->get($res);
$mech->save_content( 'abc.html' );

sub convert {
    my $n = shift;

    return "zero"      if $n == 0;
    return "one"       if $n == 1;
    return "two"       if $n == 2;
    return "three"     if $n == 3;
    return "four"      if $n == 4;
    return "five"      if $n == 5;
    return "six"       if $n == 6;
    return "seven"     if $n == 7;
    return "eight"     if $n == 8;
    return "nine"      if $n == 9;
    return "ten"       if $n == 10;
    return "eleven"    if $n == 11;
    return "twelve"    if $n == 12;
    return "thirteen"  if $n == 13;
    return "fourteen"  if $n == 14;
    return "fifteen"   if $n == 15;
    return "sixteen"   if $n == 16;
    return "seventeen" if $n == 17;
    return "eighteen"  if $n == 18;
    return "nineteen"  if $n == 19;
    return "twenty"    if $n == 20;
    return "thirty"    if $n == 30;
    return "forty"     if $n == 40;
    return "fifty"     if $n == 50;
    return "sixty"     if $n == 60;
    return "seventy"   if $n == 70;
    return "eighty"    if $n == 80;
    return "ninety"    if $n == 90;
    return convert( $n / 10 * 10 ) . " " . convert( $n - ( $n / 10 ) * 10 )
      if ( $n < 100 );
    return convert( $n / 100 ) . " hundred and " . convert( $n - ( $n / 100 ) * 100 ) if ( $n < 1000 );
}

sub count {
    my $n = shift;
    $n =~ s/\s//g;
    return length($n);
}

