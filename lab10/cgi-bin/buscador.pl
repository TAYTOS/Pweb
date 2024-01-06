#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
my $Year = $q->param('year');

my $user='alumno';
my $password='pweb1';
my $dsn="DBI:mysql:database=pweb1;host=127.0.0.1";
my $dbh= DBI->connect($dsn, $user, $password) or die("no se pudo conectar");
my $sth=$dbh->prepare("SELECT * FROM peliculas where Year=?");

$sth->execute($Year);
my $i=0;
print "Content-tupe:text/html\n\n";
while(my @row = $sth->fetchrow_array){
    print "@row\n";
    $i++;
}
if($i==0){
    print "no se encontraron coincidencias";
}
$sth->finish;
$dbh->disconnect;