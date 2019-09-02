$ontext
Ya que, en el problema de woodcarving no hab�a un l�mite de elementos para coger, es decir no hab�a un l�mite de
producci�n, se pod�an hacer todos los elementos que se quisieran. No obstante, como ac� cada art�culo tiene un
valor y no es una variable que se pueda manejar (no es de decisi�n ni una restricci�n), por eso existe un l�mite
del valor m�ximo de la funci�n objetivo.
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
