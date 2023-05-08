Funciones Lambda en Ruby
========================

### Introducción

En Ruby, una función lambda es una forma de definir funciones anónimas que se pueden asignar a variables y pasar como argumentos a otras funciones. Las funciones lambda son una forma concisa y eficiente de crear código reusable y modular.

### Sintaxis Básica

La sintaxis básica para definir una función lambda en Ruby es la siguiente:

```ruby
lambda { |argumento| expresión }
```

Donde `argumento` es el nombre del argumento que se pasará a la función y `expresión` es la expresión que se evaluará cuando se llame a la función.

### Asignación a una variable

Las funciones lambda se pueden asignar a variables para su posterior uso. La sintaxis para asignar una función lambda a una variable es la siguiente:

```ruby
variable_lambda = lambda { |argumento| expresión }
```

### Llamando una función lambda

Para llamar a una función lambda, se utiliza el método `call`. La sintaxis para llamar a una función lambda es la siguiente:

```ruby
variable_lambda.call(argumento)
```

Donde `variable_lambda` es la variable que contiene la función lambda y `argumento` es el valor del argumento que se va a pasar a la función.

### Argumentos y bloques

Las funciones lambda pueden tomar uno o más argumentos separados por comas y también pueden aceptar bloques de código. La sintaxis para definir una función lambda con argumentos y un bloque es la siguiente:

```ruby
lambda { |argumento1, argumento2, &bloque| expresión }
```

Donde `argumento1` y `argumento2` son los nombres de los argumentos y `&bloque` es el nombre del bloque.

### Funciones Lambda con Hashes

Las funciones lambda también se pueden utilizar con hashes en Ruby. La sintaxis para crear una función lambda con hashes es la siguiente:

```ruby
lambda { |hash| expresión }
```

Donde `hash` es el nombre del hash que se va a pasar como argumento a la función.

------------------
Aquí se presentan algunos ejemplos de cómo se pueden utilizar las funciones lambda en Ruby.

## Ejemplo 1: Ordenamiento de un array

Supongamos que tenemos un array de números y queremos ordenarlos de menor a mayor utilizando una función lambda. Podemos hacerlo de la siguiente manera:

```ruby
array = [5, 2, 7, 1, 9, 3]
ordenado = array.sort { |a, b| a <=> b }
puts ordenado.inspect
```

En este ejemplo, la función lambda se define dentro del método `sort`, utilizando los argumentos `a` y `b`. La expresión `a <=> b` compara los valores de `a` y `b`, y devuelve `-1`, `0`, o `1` según si `a` es menor, igual o mayor que `b`. De esta manera, la función lambda indica cómo deben ser comparados los elementos del array para ordenarlos.

Para extenderlo más se ha añadido un ejemplo de ordenamiento de un array de objetos. El archivo se llama `Ejemplo1.rb`.
### Ordenando una lista de objetos con lambdas en Ruby en Ejemplo1.rb

El código muestra cómo usar lambdas para ordenar una lista de objetos `Employee` en función de distintos atributos, como el nombre, la edad y el salario.

Se utilizan las funciones `sort_by` y `sort`, junto con lambdas que indican qué atributo se debe tener en cuenta para el ordenamiento y en qué orden (ascendente o descendente). Además, en el último ejemplo de ordenamiento se muestra cómo se puede ordenar por múltiples atributos, especificando cómo manejar empates entre elementos.

## Ejemplo 2: Filtrado de elementos de un array

Supongamos que tenemos un array de números y queremos filtrar los que son pares utilizando una función lambda. Podemos hacerlo de la siguiente manera:

```ruby
array = [5, 2, 7, 1, 9, 3]
pares = array.select { |numero| numero.even? }
puts pares.inspect
```

En este ejemplo, la función lambda se define dentro del método `select`, utilizando el argumento `numero`. La expresión `numero.even?` devuelve `true` si `numero` es par, y `false` si es impar. De esta manera, la función lambda indica qué elementos del array deben ser seleccionados.

### Filtrando una lista de objetos con lambdas en Ruby en Ejemplo2.rb
En este ejemplo de uso de lambdas en Ruby, creamos una lista de empleados y utilizamos `select` con una lambda para seleccionar los empleados cuyo salario es mayor a $2500. La lambda accede al atributo `salary` de cada objeto `Employee` y compara su valor con 2500 para determinar si el empleado debe ser seleccionado. Este es un ejemplo práctico de cómo las lambdas pueden ser utilizadas para filtrar elementos de una lista de objetos según ciertos criterios de manera simple y eficiente en Ruby.

## Ejemplo 3: Creación de un hash a partir de un array

Supongamos que tenemos un array de nombres y queremos crear un hash donde las claves sean los nombres y los valores sean sus longitudes utilizando una función lambda. Podemos hacerlo de la siguiente manera:

```ruby
nombres = ["Juan", "María", "Pedro", "Luisa"]
hash_nombres = nombres.map { |nombre| [nombre, nombre.length] }.to_h
puts hash_nombres.inspect
```

En este ejemplo, la función lambda se define dentro del método `map`, utilizando el argumento `nombre`. La expresión `[nombre, nombre.length]` devuelve un array con dos elementos: el nombre y su longitud. De esta manera, la función lambda indica cómo deben ser transformados los elementos del array para crear el hash. Luego, se utiliza el método `to_h` para convertir el array de arrays en un hash.

### Creando un hash a partir de una lista de objetos con lambdas en Ruby en Ejemplo3.rb
Este fragmento de código muestra el uso de la función `map` en Ruby para transformar una lista de objetos en una lista de hashes con información específica. En primer lugar, se utiliza `map` para crear una lista de hashes que contienen solo el nombre y el salario de cada empleado. Luego, se imprime esta lista utilizando `inspect`. Después, se vuelve a utilizar `map` para crear una lista de hashes que contienen el nombre y el doble del salario de cada empleado, y se imprime esta lista también. Finalmente, se muestra cómo se puede utilizar el mapa generado para obtener el salario de un empleado en particular, en este caso "Violeta".

## Ejemplo 4: Funciones Lambda con condiciones

Las funciones lambda también pueden tener condiciones para realizar diferentes acciones según los valores de los argumentos. La sintaxis para crear una función lambda con una condición es la siguiente:

```ruby
lambda { |argumento|
  if condición
    expresión1
  else
    expresión2
  end
}
```

Donde `condición` es la condición que se evalúa y `expresión1` y `expresión2` son las expresiones que se evalúan si la condición es verdadera o falsa, respectivamente.

### Funciones Lambda con condiciones en Ruby en Ejemplo1.rb
En el primer ejemplo vimos que para comparar nombre y edad de los empleados se puede utilizar el operador `<=>`. Sin embargo, si se quiere ordenar por nombre y luego por edad, no se puede utilizar este operador. En este caso, se puede utilizar una función lambda con una condición para ordenar primero por nombre y luego por edad. La sintaxis para hacerlo es la siguiente:

```ruby

ordered_by_name_and_age = employees.sort do |a, b|
  if a.name == b.name
    a.age <=> b.age
  else
    a.name <=> b.name
  end
end
```



## Ejemplo 5: Funciones Lambda como argumentos de otras funciones

Una de las ventajas de las funciones lambda es que se pueden pasar como argumentos a otras funciones. Esto es útil para crear funciones genéricas que pueden trabajar con diferentes funciones lambda. La sintaxis para pasar una función lambda como argumento a otra función es la siguiente:

```ruby
def funcion_generica(lambda_argumento)
  lambda_argumento.call(argumento)
end
```

Donde `funcion_generica` es la función que recibe una función lambda como argumento y la llama utilizando el método `call`.

### Funciones Lambda como argumentos de otras funciones en Ejemplo4.rb
En el codigo 'Ejemplo4.rb' se muestra cómo se puede utilizar una función lambda como argumento de otra función. En este caso, la función `transformar_array` toma un array y una función lambda como argumentos, y devuelve un nuevo array con cada elemento transformado por la función lambda. La función lambda se llama utilizando el método `call`.


## Comparando funciones lambda con funciones regulares
Presentamos dos pequeños codigos de una calculadora con funciones lambda o sin ellas, para que se pueda ver la diferencia entre ambas.

### Calculadora con funciones lambda
```ruby
class Calculadora
  def initialize
    @operaciones = {
      suma: lambda { |a, b| a + b },
      resta: lambda { |a, b| a - b },
      multiplicacion: lambda { |a, b| a * b },
      division: lambda { |a, b| a / b }
    }
  end

  def calcular(operacion, a, b)
    @operaciones[operacion.to_sym].call(a, b)
  end
end
```
### Calculadora sin funciones lambda
```ruby
class Calculadora
  def initialize
    @operaciones = {
      suma: :sumar,
      resta: :restar,
      multiplicacion: :multiplicar,
      division: :dividir
    }
  end

  def calcular(operacion, a, b)
    self.send(@operaciones[operacion.to_sym], a, b)
  end

  def sumar(a, b)
    a + b
  end

  def restar(a, b)
    a - b
  end

  def multiplicar(a, b)
    a * b
  end

  def dividir(a, b)
    a / b
  end
```
Aunque el ejemplo es algo forzado, se ve la diferencia entre ambos codigos, y como las funciones lambda pueden hacer el codigo mas legible y compacto.

## Ejemplo de ONG
En el código, se definen tres funciones lambda: `@donate_lambda`, `@report_lambda`, y `@exit_lambda`. La primera toma dos argumentos y llama al método `donate` de la clase `ONGSystem`, la segunda no toma argumentos y llama al método `generate_report`, y la tercera simplemente imprime un mensaje antes de salir del programa utilizando la función `exit`. El uso de funciones lambda en la interfaz de usuario hace que el código sea modular y escalable, ya que solo se necesita definir nuevas funciones lambda y agregarlas al menú existente para agregar nuevas opciones, sin necesidad de cambiar el código existente que maneja la lógica de la interfaz de usuario.


# Conclusion

Las funciones lambda son una herramienta poderosa en el lenguaje Ruby para crear funciones anónimas y reusables que se pueden asignar a variables y pasar como argumentos a otras funciones. La sintaxis para definir y llamar a una función lambda es sencilla y su uso puede ayudar a simplificar el código y hacerlo más modular y fácil de mantener.

