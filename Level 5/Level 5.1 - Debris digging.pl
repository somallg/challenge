use strict;
use warnings;

my $file = "GEMS";
my $data = do {
    local $/ = undef;
    open my $fh, "<", $file
        or die "could not open $file: $!";
    <$fh>;
};

$data =~ s/[^a-z]//g;
print $data;
#capstone

