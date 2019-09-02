$ontext
Utilizando un solver diferente, en este caso BDMLP, el tiempo de ejecución del modelo cambia aunque
la respuesta a la minimización no cambió.
Así mismo cambian todos los parámetros presentados en la consola de la derecha, puesto que cada
solver funciona de una manera única y diferente.
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
funcionObjetivo       Funcion Objetivo

restrPresupuesto         restriccion de presupueto ;


funcionObjetivo        ..      z =e= sum((i), valor(i) * x(i));


restrPresupuesto            ..      sum((i), valor(i)*x(i)) =e= PRESUPUESTO;

Model rescate /all/ ;
option mip=BDMLP

Solve rescate using mip minimizing z

Display x.l;
Display z.l;
