use strict;
use warnings;
use integer;

{
	local $\;
	print unpack("%32W*", <>);
}



