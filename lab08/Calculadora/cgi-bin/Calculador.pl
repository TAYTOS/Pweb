#!/xampp/perl/bin/perl
use strict;
use warnings;
use CGI;

# Definición de la función 'calcular'
sub calcular {
    my ($p1, $p2, $p3) = @_;  # Parámetros: $p1, $p2 (operador), $p3

    # Verificar si el operador es válido y realizar la operación correspondiente
    if ($p3 ne "*" && $p3 ne "+" && $p3 ne "-" && $p3 ne "/" && $p3 ne ""){
        if ($p2 eq "+") {
            $p1 += $p3;  # Sumar
        } elsif ($p2 eq "-") {
            $p1 -= $p3;  # Restar
        } elsif ($p2 eq "*") {
            $p1 *= $p3;  # Multiplicar
        } elsif ($p2 eq "/") {
            if ($p3 == 0) {
                $p1 = "error";  # División por cero, asignar "error"
            } else {
                $p1 /= $p3;  # Dividir
            }
        }
    }
    return $p1;  # Devolver el resultado de la operación
}
# Crear un nuevo objeto CGI
my $q = CGI->new;
# Obtener la expresión matemática del parámetro 'exp' enviado por el formulario
my $sent = $q->param('exp');
# Dividir la expresión en elementos individuales y almacenarlos en un array @ex
my @ex =  split(" ", $sent);
# Inicializar el resultado con el primer número de la expresión
my $res = $ex[0];
# Iterar sobre la expresión, realizando cálculos basados en la función 'calcular'
for (my $e = 0; $e < scalar(@ex) - 2; $e += 2) {
    $res = calcular($res, $ex[$e + 1], $ex[$e + 2]);  # Realizar cálculo
}
# Imprimir el resultado como una respuesta HTML
print "Content-type: text/html\n\n";
print "<HTML><HEAD>\n";
print "<TITLE>Resultado</TITLE>\n";
print "</HEAD><BODY>\n";
print "<H3>Se ha calculado su resultado :$res</H3>\n";  # Mostrar el resultado
print "<A href = \"../index.html\">regresar</A>\n";  # Agregar un enlace para regresar
print "</BODY>\n</HTML>\n";