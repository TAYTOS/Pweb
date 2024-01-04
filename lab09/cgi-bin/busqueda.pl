#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;
use Text::CSV;

my $csv = Text::CSV->new({ sep_char => '|' });
  
sub Search(){
    my $q = CGI->new;
    my $Name = $q->param('Name');
    my $Dep = $q->param('Department');
    my $Prog = $q->param('Program');
    my $Per = $q->param('Periodo');
    
    my @Uni;
    my ($param,$find) = (1,1);
    my $failed = 0;

    if($Per ne ""){
        $param = 1;
    }
    else{
        $Per = 0;
    }
    if($Name ne ""){
        $param = 1;
        $Name = uc($Name);
    }
    else{
        $Name = "|";    
    }

    if($param != 0){
        open(data,"../data/Programas\ de\ Universidades.csv") or die "no existe el archivo ._.";
        <data>;
        while(my $line = <data>){
            chomp $line;

            if($csv->parse($line)){
                $failed++;
                @Uni = $csv->fields();
                if($Uni[1] =~ $Name && $Uni[16] =~ $Prog  && $Uni[10] =~ $Dep && $Uni[4] =~ $Per){
                    open(BoxHTML,"..\\box.html") or die print "no existe el archivo ._.";
                    while(my $l = <BoxHTML>){   

                        if($l =~ "xNombrex" ){
                            print "<p> ".$Uni[1]." </p>";
                            next;
                        }   
                        elsif($l =~ "xLugarx" ){
                            print "<p> ".$Uni[10]." </p>";
                            next;
                        }                                                                                                
                        elsif($l =~ "xEspecialidadx" ){
                            print "<p> ".$Uni[16]." </p>";
                            next;
                        }
                        elsif($l =~ "xPeriodx" ){
                            print "<p> ".$Uni[4]." </p>";
                            next;
                        }

                        print $l;
                    }
                    close(BoxHTML);
                }
            }
            else{
                print $line."</br>";
                last;
            }
        }
        close(data);
        print $failed;
    }
    else{
        print $q->redirect("../index.html");
    }
}


print "Content-type: text/html\n\n";
open(MainHTML,"..\\index.html") or die print "no existe el archivo ._.";
while(my $l = <MainHTML>){   
    
    if($l =~ "xEstilosx" ){
        print "<link rel=\"stylesheet\" href=\"../css/estilos.css\">";
        next;
    }   
    elsif($l =~ "xFormx" ){
        print "<form action=\"./busqueda.pl\" method=\"GET\">";
        next;
    }                                                                                                
    elsif($l =~ "xSearchx" ){
        Search();
        next;
    }
    elsif($l =~ "xIconx" ){
        print "<img id =\"icon\" src=\"../Images/UNSA-Icon.png\" alt=\"img unsa\">";
        next;
    }

    print $l;
    
}
close(MainHTML);

