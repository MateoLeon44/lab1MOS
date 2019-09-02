$ontext
Problema del rescate:

 Una persona tiene la posibilidad de tomar 8 objetos de diferente valor y peso. La
 solución consiste en que la persona tome los objetos de mayor valor cuyo peso total
 no supere un determinado peso máximo PMAX.

 Tener en cuenta los siguientes parámetros:

 Número de objetos: 8
 PMAX=102
 Peso de cada objeto:   2,  20, 20, 30, 40, 30, 60 y 10 respectivamente.
 Valor de cada objeto: 15, 100, 90, 60, 40, 15, 10 y 1 respectivamente.

$offtext


$ontext
ERROR
No se pueden definir constantes de ese modo, se podría definir un Scalar. No obstante, no tiene sentido en la
optimización, por lo cual se cambia

Set NUM_OBJECTS 8

Set i objetos / o1*o$NUM_OBJECTS$ /;

por

Set i objetos / o1*o8 /;

$offtext

Set i objetos / o1*o8 /;

*ERROR, ya que es una única variable no es necesario asignarle otro nombre, es decir con PMAX es suficiente
Scalar PMAX peso maximo / 102 /


$ontext
Error, el compilador de gams asigna la variable al valor solo si están uno debajo del otro
Así mismo, la definición de variables somo Scalar está mal definida, para scalar se tiene que poner el nombre
de la variable sin slash  (/) y el valor que ésta toma dentro de dos slash  / valor /
Las variables deben estar una debajo de otra para que el compilador de Gams las lea y debe finalizar la definición
con un ;

Scalar  peso   peso de cada objeto i
                         o1      /2/
                         o2      /20/
                         03      /20/
                         o4      /30/
                         o5      /40/
                         o6      /30/
                         o7      /60/
                         o8      /10/;

No obstante, como se quiere asignar es a un parametro sub i, es decir peso(i), se debe hacer con Parameters, puesto
que Scalar no tiene definición de index
$offtext

Parameters  peso(i)   peso de cada objeto i
                         /o1      2
                         o2      20
                         o3      20
                         o4      30
                         o5      40
                         o6      30
                         o7      60
                         o8      10/;



$ontext
Error, el compilador de gams asigna la variable al valor solo si están uno debajo del otro sin coma (,)
Así mismo, Parameter es en plural y lleva un ; al finalizar la asignación de las variables
Por último, j no está definido, por lo cual se cambia por i que es un objeto definido anteriormente
$offtext

Parameters  valor(i)   valor de cada objeto i
                     /o1 15
                     o2 100
                     o3 90
                     o4 60
                     o5 40
                     o6 15
                     o7 10
                     o8 1/;

Variable
  tomar(i)      variable tomar_i
  z           maximizacion;
*ERROR, falta definir que la variable tomar es una variable binaria (solo puede tomar 0 o 1)
binary variable tomar;



*ERROR, falta definir la ecuación restrPeso antes de asignarle un valor, es necesario mover el ;
Equations
funcionObjetivo       Funcion Objetivo
restrPeso             Define la restricción del peso;

funcionObjetivo        ..      z =e= sum((i), valor(i) * tomar(i));
*ERROR, falta multiplicar el peso(i) * tomar(i), sino solo sumaría los pesos de todos los elementos
*independientemente si se toman o no
restrPeso            ..      sum((i), peso(i)*tomar(i)) =l= PMAX;



Model objetos /all/ ;

*ERROR, lp no se puede utilizar en este caso puesto que hay variables discretas (tomar)
option mip=CPLEX

*ERROR, lp no se puede utilizar en este caso puesto que hay variables discretas (tomar)
Solve objetos using mip maximizing z

*ERROR, no existe una variable x en el modelo, por lo cual se cambia por tomar que es la variable binaria
Display tomar.l;
Display z.l;

