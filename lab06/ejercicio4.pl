#!/usr/bin/perl
use List::Util qw(max min);
print "cantidad de notas a ingresar: ";
$n=<STDIN>;
@notas=ingresar($n);
sub ingresar{
    my @res = ();
    for($i=0;$i< $_[0] ;$i++){
        print "\nIngrese un notas: ";
        $res[$i] = <STDIN>;
    }
    return @res;
}

sub promedio{
    $suma=0;
    foreach $i (@_){
        $suma += $i;
    }
    $prom;
    $prom=($suma-min(@_)+max(@_))/@_;
    return $prom;
}
$promedio = promedio(@notas);
print "el promedio es ".$promedio;