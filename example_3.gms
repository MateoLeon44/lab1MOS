$ontext
Ya que, en el problema de woodcarving no había un límite de elementos para coger, es decir no había un límite de
producción, se podían hacer todos los elementos que se quisieran. No obstante, como acá cada artículo tiene un
valor y no es una variable que se pueda manejar (no es de decisión ni una restricción), por eso existe un límite
del valor máximo de la función objetivo.
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
