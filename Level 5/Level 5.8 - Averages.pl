use strict;
use warnings;
use Data::Dumper;
use WWW::Mechanize;
use integer;

my $mech = WWW::Mechanize->new;

$mech->show_progress(1);
$mech->get('http://www.rankk.org');

$mech->submit_form(
    form_number => 1,
    fields      => {
        username => 'Khoaito',
        passwd   => ''
    }
);

my $lvl = 'http://www.rankk.org/challenges/averages.py';
$mech->get($lvl);

my ( $data, $i, $j, @data );
( $i, $j ) = $mech->content =~ m/at\spositions\s(\d*)\sand\s(\d*)/mg;
( $data ) = $mech->content =~ m/<pre>(.*)<\/pre>/mg;
$data =~ s/<br\s\/>//g;
@data = split(',', $data );
my @sort = sort { $a <=> $b } @data;

print Dumper [$i, $data[$i-1]];
print Dumper [$j, $data[$j-1]];
print Dumper @data;
print Dumper @sort;
print Dumper mean(\@data);
print Dumper median(\@sort);
print Dumper mode(\@data);
my $res = $lvl . '?solution=' . mean(\@data) . median(\@sort) . mode(\@data) . $data[$i-1] . $data[$j-1];

$mech->save_content( 'abc.html');
$mech->get($res);

sub mean {
    my $data = shift;
    my $sum = 0;
    map { $sum += $_ } @$data;

    return $sum/scalar @$data;
}

sub median {
    my $data = shift;
    my $n = scalar @$data;

    if ( $n % 2 ) {
        return $data->[($n+1)/2 - 1];
    } else {
        return ( $data->[$n/2] + $data->[$n/2] ) / 2;
    }
}

sub mode {
    my $data = shift;
    my %mode;
    foreach ( @$data ) {
        $mode{$_}++;
    }
    
    my @res = sort { 
        return 1
            if $mode{$b} > $mode{$a};
        return -1
            if $mode{$b} < $mode{$a};
        return $b <=> $a;
        } keys %mode;
    
    return $res[0];
}
    

