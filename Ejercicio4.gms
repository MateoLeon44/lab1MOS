Variables
T        App de text
C        App de calculadora
z        Maximizaci�n;

Positive Variable T;
Positive Variable C;

Equations
funcionObjetivo          funci�n objetivo
restrJules               restricci�n de jules
restrMem                 restricci�n de memoria
signo1                   sig 1
signo2                   sig 2;

funcionObjetivo          ..      z =e= 3*T + 1*C;
restrJules               ..      T + 0.1*C =l= 1000;
restrMem                 ..      8*T + 2*C =l= 2000;
signo1                   ..      T =g= 0;
signo2                   ..      C =g= 0;

Model Transport /all/ ;

option lp=cplex
Solve transport using lp maximizing z;

Display T.l
Display C.l
Display z.l