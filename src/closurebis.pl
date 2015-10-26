my $start = $ARGV[0] || 999999;
my $next_id = gen_id( $start );
print $next_id->(), "\n" for 1 .. 10;  # Next 10 IDs

sub gen_id {
    my $curr = shift;
    return sub {
        0 while ! is_valid( ++$curr );
        return $curr;
    };
}
sub is_valid {
    my ($num, $chk) = (shift, '');
    my $tot;
    for ( 0 .. length($num) - 1 ) {
        my $dig = substr($num, $_, 1);
        $_ % 2 ? ($chk .= $dig * 2) : ($tot += $dig);
    }
    $tot += $_ for split //, $chk;
    return $tot % 10 == 0 ? 1 : 0;
}

