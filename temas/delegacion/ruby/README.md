# Delegación en Ruby

La delegación es un patrón de diseño en el que un objeto envía una solicitud a otro objeto para realizar una tarea en su nombre. En Ruby, se puede implementar la delegación mediante el uso de varios métodos de la clase `Delegate` y la clase `Forwardable`. En esta guía, se explicará el funcionamiento de cuatro códigos diferentes que utilizan la delegación en Ruby.

## Delegación Simple (Delegacion simple delegator.rb)

El primer ejemplo utiliza la clase `SimpleDelegator`, que es un subclase de la clase `Delegate`. En este código, se crea una clase `Memoria` con los métodos `escribir` y `leer`. Luego, se define una clase `Ordenador` que hereda de `SimpleDelegator`. La instancia de `Ordenador` se inicializa con una instancia de `Memoria`. Como resultado, todos los métodos de `Memoria` se pueden llamar en la instancia de `Ordenador` mediante la delegación.

## Delegación Forwardable (Delegacion forward.rb)

El segundo ejemplo utiliza la clase `Forwardable`. En este código, se crea una clase `Memoria` con los métodos `escribir` y `leer`. Luego, se define una clase `Ordenador` que extiende `Forwardable`. Los métodos de delegación se definen mediante el método `def_delegators` que acepta el objeto que recibe la delegación (en este caso, `@memoria`) y los nombres de los métodos que se deben delegar (`leer` y `escribir`). En el método constructor de `Ordenador`, se crea una instancia de `Memoria` y se almacena en la variable de instancia `@memoria`. Todos los métodos de `Memoria` se pueden llamar en la instancia de `Ordenador` mediante la delegación.

## Delegación Dinámica (Delegacion dinamica.rb)

El tercer ejemplo utiliza la delegación dinámica, que permite crear métodos delegados en tiempo de ejecución. En este código, se crea una clase `Memoria` con los métodos `escribir` y `leer`. Luego, se define una clase `Computador` que toma una instancia de `Memoria` como argumento de su constructor. En el constructor de `Computador`, se llama al método privado `delegate_memory_methods`, que utiliza el método `instance_methods` para obtener una lista de los métodos definidos en `Memoria`. Luego, se define un método delegado para cada método en la lista, que llama al mismo método en la instancia de `Memoria`. Como resultado, todos los métodos de `Memoria` se pueden llamar en la instancia de `Computador` mediante la delegación.

## Delegación Delegator (Delegacion delegator.rb)

El cuarto ejemplo utiliza la clase `Delegator`, que es la clase base de `SimpleDelegator`. En este código, se crea una clase `Memoria` con los métodos `escribir` y `leer`. Luego, se define una clase `Ordenador` que hereda de `Delegator`. En la definición de `Ordenador`, se llama al método `def_delegators` que acepta el objeto que recibe la delegación (en este caso, `@Memoria`) y los nombres de los métodos
