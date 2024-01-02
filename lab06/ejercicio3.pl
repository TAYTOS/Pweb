#!/usr/bin/perl
print "Ingrese palabra que desea invertir: ";
my $palabra=<STDIN>;

sub reverso{
    my $value = "";
    for($i=length(@_[0])-1 ;$i>= 0 ;$i--){
        $value=$value . substr(@_[0],$i,1);
    }
    return $value;
}
my $invertido = reverso($palabra);
print $invertido;



