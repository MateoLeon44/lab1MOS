*************************************************************************
***    Problema Woodcarving                                           ***
***                                                                   ***
***    Yezid E. Donoso Meisel                                         ***
***    Germán Montoya                                                 ***
***    Carlos Andrés Lozano Garzón                                    ***
*                                                                     ***
*      El Problema de producción                                      ***
*                                                                     ***
*************************************************************************

$ontext
Al utilizar el solver BARON (diferente al CPLEX predeterminado), se obtuvieron los mismos resultados para la
modelación. Sin embargo, lo que si cambió fueron los parametros:
                         BARON      CPLEX
Generation Time          0.015s     0.031s
Execution Time           0.031s     0.031s
Resource Usage           0.050      0.062
Iteration Count          0          3

$offtext

Variables
  x1      El enlace i j es utilizado para transportar desde i a j
  x2      El enlace i j es utilizado para transportar desde i a j
  z       maximizacion ;

Positive Variable x1;
Positive Variable x2;


Equations

Fun_Obj                  Funcion Objetivo
acabado                  acabado
carpinteria              carpinteria
demanda_soldados         demanda_soldados
signo1                   signo1
signo2                   signo2;


Fun_Obj                  ..      z =e= 3*x1 + 2*x2;

acabado                  ..      2*x1 + x2 =l= 100;

carpinteria              ..      x1 + x2 =l= 80;

demanda_soldados         ..      x1  =l= 40;

signo1                   ..      x1 =g= 0;

signo2                   ..      x2 =g= 0;

Model Transport /all/ ;

option lp=BARON
Solve transport using lp maximizing z;

Display x1.l, x1.m
Display x2.l, x2.m
Display z.l, z.m
