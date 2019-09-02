Sets
n   nodosEntrantes /n1*n7/
cor   coordenadas X Y /c1, c2/
Alias(ns,n);



Table cor1(n,cor) Primer set de nodos
      c1   c2
n1    20   6
n2    22   1
n3    9    2
n4    3    25
n5    21   10
n6    29   2
n7    14   12;

Table cor2(ns,cor) Segundo set de nodos
      c1   c2
n1    20   6
n2    22   1
n3    9    2
n4    3    25
n5    21   10
n6    29   2
n7    14   12;

Parameter c(n,ns) Costo del Enlace ;
  c(n,ns) = ((power((cor2(ns,'c1')-cor1(n,'c1')),2)
            +power((cor2(ns,'c2')-cor1(n,'c2')),2))
            **(1/2));
  c(n,ns)$(c(n,ns)<=0 or c(n,ns) > 20) = 999;

Variables
  x(n,ns)      Var decisión si se utiliza el enlace n-ns
  z           minimización;
Binary Variable x;

Equations
funcionObjetivo    funciónObjetivo
origen         origen nodo 4
destino        destino nodo 6
intermedio1    nodoIntermedio1
intermedio2    nodoIntermedio2
intermedio3    nodoIntermedio3
intermedio5    nodoIntermedio5
intermedio7    nodoIntermedio7;

funcionObjetivo    ..  z =e= sum((n,ns),c(n,ns)*x(n,ns));
origen         ..  sum((ns), x('n4',ns)) =e= 1;
destino        ..  sum((n), x(n,'n6')) =e= 1;
intermedio1    ..  sum((n,ns),x(n,'n1'))-sum((n,ns),x('n1',n)) =e= 0;
intermedio2    ..  sum((n,ns),x(n,'n2'))-sum((n,ns),x('n2',n)) =e= 0;
intermedio3    ..  sum((n,ns),x(n,'n3'))-sum((n,ns),x('n3',n)) =e= 0;
intermedio5    ..  sum((n,ns),x(n,'n5'))-sum((n,ns),x('n5',n)) =e= 0;
intermedio7    ..  sum((n,ns),x(n,'n7'))-sum((n,ns),x('n7',n)) =e= 0;



Model p5 /all/;
option mip=CBC
Solve p5 using mip minimizing z;

Display x.l
Display z.l
