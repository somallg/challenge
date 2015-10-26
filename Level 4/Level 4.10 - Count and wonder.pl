use strict;
use warnings;

my $file = "count-and-wonder";
my $data = do {
    local $/ = undef;
    open my $fh, "<", $file
        or die "could not open $file: $!";
    <$fh>;
};

my %d;

foreach my $i (split(//, $data)){
    $d{$i}++;
}

foreach my $value (sort { $d{$b} <=> $d{$a} } keys %d) {
    print "$value";
}

# pYraMiDoFkHuJx #
# pyramidofkhufu #

