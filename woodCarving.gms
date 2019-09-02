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
