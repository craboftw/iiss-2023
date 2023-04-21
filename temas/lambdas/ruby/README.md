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

### Ejemplo 1: Ordenamiento de un array

Supongamos que tenemos un array de números y queremos ordenarlos de menor a mayor utilizando una función lambda. Podemos hacerlo de la siguiente manera:

```ruby
array = [5, 2, 7, 1, 9, 3]
ordenado = array.sort { |a, b| a <=> b }
puts ordenado.inspect
```

En este ejemplo, la función lambda se define dentro del método `sort`, utilizando los argumentos `a` y `b`. La expresión `a <=> b` compara los valores de `a` y `b`, y devuelve `-1`, `0`, o `1` según si `a` es menor, igual o mayor que `b`. De esta manera, la función lambda indica cómo deben ser comparados los elementos del array para ordenarlos.

### Ejemplo 2: Filtrado de elementos de un array

Supongamos que tenemos un array de números y queremos filtrar los que son pares utilizando una función lambda. Podemos hacerlo de la siguiente manera:

```ruby
array = [5, 2, 7, 1, 9, 3]
pares = array.select { |numero| numero.even? }
puts pares.inspect
```

En este ejemplo, la función lambda se define dentro del método `select`, utilizando el argumento `numero`. La expresión `numero.even?` devuelve `true` si `numero` es par, y `false` si es impar. De esta manera, la función lambda indica qué elementos del array deben ser seleccionados.

### Ejemplo 3: Creación de un hash a partir de un array

Supongamos que tenemos un array de nombres y queremos crear un hash donde las claves sean los nombres y los valores sean sus longitudes utilizando una función lambda. Podemos hacerlo de la siguiente manera:

```ruby
nombres = ["Juan", "María", "Pedro", "Luisa"]
hash_nombres = nombres.map { |nombre| [nombre, nombre.length] }.to_h
puts hash_nombres.inspect
```

En este ejemplo, la función lambda se define dentro del método `map`, utilizando el argumento `nombre`. La expresión `[nombre, nombre.length]` devuelve un array con dos elementos: el nombre y su longitud. De esta manera, la función lambda indica cómo deben ser transformados los elementos del array para crear el hash. Luego, se utiliza el método `to_h` para convertir el array de arrays en un hash.


### Ejemplo 4: Funciones Lambda con condiciones

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

### Ejemplo 5: Funciones Lambda como argumentos de otras funciones

Una de las ventajas de las funciones lambda es que se pueden pasar como argumentos a otras funciones. Esto es útil para crear funciones genéricas que pueden trabajar con diferentes funciones lambda. La sintaxis para pasar una función lambda como argumento a otra función es la siguiente:

```python
def funcion_generica(lambda_argumento)
  lambda_argumento.call(argumento)
end
```

Donde `funcion_generica` es la función que recibe una función lambda como argumento y la llama utilizando el método `call`.

### Conclusion

Las funciones lambda son una herramienta poderosa en el lenguaje Ruby para crear funciones anónimas y reusables que se pueden asignar a variables y pasar como argumentos a otras funciones. La sintaxis para definir y llamar a una función lambda es sencilla y su uso puede ayudar a simplificar el código y hacerlo más modular y fácil de mantener.


```ruby
# Definimos una función lambda que toma un número como argumento y lo eleva al cuadrado
elevar_al_cuadrado = lambda { |numero| numero ** 2 }

# Definimos una función que toma un array y una función lambda como argumentos, y devuelve un nuevo array con cada elemento transformado por la función lambda
def transformar_array(array, funcion_lambda)
  resultado = []
  array.each do |elemento|
    resultado << funcion_lambda.call(elemento)
  end
  resultado
end

# Probamos la función transformar_array con el array [1, 2, 3, 4] y la función lambda elevar_al_cuadrado
puts transformar_array([1, 2, 3, 4], elevar_al_cuadrado).inspect
# Output: [1, 4, 9, 16]
```

En este ejemplo, se define una función lambda llamada `elevar_al_cuadrado` que toma un número como argumento y lo eleva al cuadrado. Luego, se define la función `transformar_array`, que toma un array y una función lambda como argumentos, y devuelve un nuevo array con cada elemento transformado por la función lambda. Dentro de `transformar_array`, se utiliza el método `each` para iterar sobre cada elemento del array y llamar a la función lambda con cada uno, y luego se agrega el resultado a un nuevo array llamado `resultado`. Finalmente, se devuelve `resultado`.

En la última línea del código, se llama a la función `transformar_array` con el array `[1, 2, 3, 4]` y la función lambda `elevar_al_cuadrado`. El resultado es un nuevo array con cada elemento elevado al cuadrado: `[1, 4, 9, 16]`.


```ruby
# Definimos una función que toma un número como argumento y lo eleva al cuadrado
def elevar_al_cuadrado(numero)
  numero ** 2
end

# Definimos una función que toma un array y una función como argumentos, y devuelve un nuevo array con cada elemento transformado por la función
def transformar_array(array, funcion)
  resultado = []
  array.each do |elemento|
    resultado << funcion.call(elemento)
  end
  resultado
end
```
```Ruby
# Probamos la función transformar_array con el array [1, 2, 3, 4] y la función elevar_al_cuadrado
puts transformar_array([1, 2, 3, 4], method(:elevar_al_cuadrado)).inspect
# Output: [1, 4, 9, 16]
```

En lugar de utilizar una función lambda, definimos una función `elevar_al_cuadrado` que toma un número como argumento y lo eleva al cuadrado. Luego, pasamos la referencia de esta función como segundo argumento en la función `transformar_array` utilizando `method(:elevar_al_cuadrado)`. En la función `transformar_array`, en lugar de utilizar `funcion_lambda.call(elemento)`, usamos `funcion.call(elemento)` para llamar a la función pasada como argumento.
La cantidad de líneas es similar, y aunque la sintaxis puede ser ligeramente diferente, no hay una ventaja significativa en el uso de funciones lambda en ruby. Sin embargo, las funciones lambda son una herramienta útil para crear funciones anónimas y reusables que se pueden asignar a variables y pasar como argumentos a otras funciones. La sintaxis para definir y llamar a una función lambda es sencilla y su uso puede ayudar a simplificar el código y hacerlo más modular y fácil de mantener.
