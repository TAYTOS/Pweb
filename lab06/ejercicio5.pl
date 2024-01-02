#!/usr/bin/perl
my @a = (0,1,1,0);
my @b = (1,0,1,0);
my @c = (0,0,0,0);
my @d = (0,0,1,0);
my @matriz= (\@a,\@b,\@c,\@d);
$n=@{$matriz[0]};

sub posiblecelebridad{
    $n=@{$_[0]};
    $candidato=0;
    if(verificar(@_[0],$candidato,$n)==1){
        return $candidato;
    }
    for($i=1;$i<$n;$i++){
        if($_[$candidato][$i]==1){
            $candidato=$i;
            if(verificar(@_[0],$candidato,$n)==1){
                return $candidato;
            }
        }
    }
    return -1;
}
#primer valor matriz segundo valor canditado tercer valor tamaño de la matriz
sub verificar{
    my $value=1;
    for(my $i=0;$i<@_[2] && $value;$i++){ 
        if($i != @_[1]) {
             
            if (($matriz[$_[1]][$i]) || !($matriz[$i][$_[1]])){
                $value = 0;
            }
            print "$i --> ".$_[1]." | $value\n";
        }
    } 
    return $value;
}
$celebridad = posiblecelebridad(@matriz);
print $celebridad;
