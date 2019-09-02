*************************************************************************
***    Problema Woodcarving                                           ***
***                                                                   ***
***    Yezid E. Donoso Meisel                                         ***
***    Germán Montoya
***    Carlos Andrés Lozano Garzón                                    ***
*                                                                     ***
*      El Problema de producción                                      ***
*                                                                     ***
*************************************************************************

$ontext
Al quitar todas las restricciones, gams nos muestra que tanto z, como x1, como x2 son 0
Es decir, para minimizar las ganancias lo mejor es no hacer ninguno de los dos o hacer lo menos que se puedan
$offtext

Variables
  x1      El enlace i j es utilizado para transportar desde i a j
  x2      El enlace i j es utilizado para transportar desde i a j
  z       maximizacion ;

Variable x1;
Variable x2;


Equations

Fun_Obj                  Funcion Objetivo;


Fun_Obj                  ..      z =e= 3*x1 + 2*x2;

Model Transport /all/ ;

option mip=CPLEX
Solve transport using mip minimizing z;

Display x1.l
Display x2.l
Display z.l
