perl -ne '($a) = ($_ =~ /([a-z])/g); $a && print $a' 2.data
=> equality
