my $str = "PYraMId bUiLdiNg WAS at ItS HEIghT fROM The FOuRTH thrOUgH ThE SIxTh dYnAsTiEs. AS it bECaME cLEAR thAt The PYRaMIDs DID noT PrOVIde pROtECTioN FOR THE MuMmiFIeD BOdiEs OF tHe kINgS BUt weRe OBViOUS tARGeTS fOR GRave ROBberS, LaTEr KINGS wEre BUrIEd IN hIDDen tOmbS cUT Into RoCk cLiFfs.";

$str =~ s/\s+//g;
$str =~ s/\W//g;
$str =~ s/[a-z]/0/g;
$str =~ s/[A-Z]/1/g;

$str =~ s/0/B/g;
$str =~ s/1/A/g;

print $str;

# GOODIOBTHESOLUTIONISTHENAMEOFTHISCIPHERMETHODXX #
# baconian #
