#!/xampp/perl/bin/perl
use strict;
use warnings;
use DBI;

my $user='alumno';
my $password='pweb1';
my $dsn="DBI:mysql:database=pweb1;host=127.0.0.1";
my $dbh= DBI->connect($dsn, $user, $password) or die("no se pudo conectar");
my $year=1985;
my $sth=$dbh->prepare("SELECT * FROM peliculas where year=?");

$sth->execute($year);
while(my @row = $sth->fetchrow_array){
    print "@row\n";
}

$sth->finish;
$dbh->disconnect;