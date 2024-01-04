#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;
use Text::CSV;

my $csv = Text::CSV->new({ sep_char => '|' });