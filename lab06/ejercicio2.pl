#!/usr/bin/perl
@lista = (2, 1, 667, 23, 2.2, 5, 6);


sub mayor(@a){
    my $value = $_[0];
    for($i=1;$i< @_ ;$i++){
        if($_[$i]>$value){
            $value= $_[$i];
        }
    }
    return $value;
}
#my @lista = ingresar(5);
my $max = mayor(@lista);
print "el numero mayor es ".$max;
#print $lista[0]