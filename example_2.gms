$ontext
Si se maximiza la función objetivo, nos dice que llevemos todos los articulos, es decir como no tenemos restricción
de presupuesto, podemos llevarnos todos los artículos.
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

Solve rescate using mip maximizing z

Display x.l;
Display z.l;
