$ontext
Gams nos arroja el valor 0, puesto que como no hay restricciones de que se iene que llevar algún elemento, éste nos
indica que lo mejor es no llevar ningún elemento.
$offtext

$Set NUM_ARTICLES 5

Set i articulos / a1*a%NUM_ARTICLES% /;

Scalar PRESUPUESTO presupuesto
             / 10 /

Parameter  valor(i)   valor de cada articulo i
                     /    a1 12, a2 5, a3 9, a4 6, a5 4    /

Variables
  x(i)       variable x_i
  z           minimizacion;
Binary Variable x;


Equations
funcionObjetivo       Funcion Objetivo;


funcionObjetivo        ..      z =e= sum((i), valor(i) * x(i));




Model rescate /all/ ;
option mip=CPLEX

Solve rescate using mip minimizing z

Display x.l;
Display z.l;
