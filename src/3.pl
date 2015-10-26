perl -ne '($a) = ($_ =~ /[a-z][A-Z]{3}([a-z])[A-Z]{3}[a-z]/); $a && print $a' 3.data
=> linkedlist
