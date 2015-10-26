my $q = 28064;
my $base = 8;
my $str;

while ($q > 0) {
    $str = $q % $base . $str;
    $q = $q / $base;
}

print $str;
