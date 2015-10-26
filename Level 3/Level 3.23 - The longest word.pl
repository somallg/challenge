#!/usr/bin/perl -lna
map(s/(\W)//g, @F);
$hash{$_}++ foreach(@F);
END {
	@tab = keys %hash;
	foreach (@tab) {
		if (length > $max) {
			$max = length;
			$longest = $_;
		}
	}
	print $longest;
}

# Iwaennetjerwysenwy #
