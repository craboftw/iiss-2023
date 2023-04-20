  - # Implementación de Optionals en Ruby
===================================

En Ruby, no existe una clase nativa llamada "Optional" como en otros lenguajes de programación, como Java y Swift. Sin embargo, existen varias formas de implementar la funcionalidad de Optionals en Ruby. A continuación, se presentan algunas de las opciones:

- ### Utilizar `nil`
--------------

En Ruby, `nil` es un objeto que representa la ausencia de valor. Al igual que los Optionals, puede ser utilizado para indicar que un valor puede ser nulo. Por ejemplo, si una variable puede ser nula, se puede inicializar con `nil` y luego verificar si es `nil` para determinar si contiene un valor o no.

- ### Utilizar el gem "maybe"
-----------------------

El gem "maybe" proporciona una sintaxis similar a los Optionals en otros lenguajes de programación. Se puede utilizar para encadenar llamadas a métodos en objetos que pueden ser nulos. Por ejemplo, en lugar de escribir `if object && object.method`, se puede escribir `object&.method`.

- ### Utilizar el gem "dry-monads"
----------------------------

El gem "dry-monads" proporciona una estructura monádica que incluye el tipo "Option". El tipo `Option` se utiliza para indicar que un valor puede ser nulo. También proporciona métodos para trabajar con valores `Option`, como `map`, `bind` y `unwrap`.

 - ### Utilizar el gem "kleisli"
-------------------------

El gem "kleisli" proporciona una implementación funcional de Optionals. Proporciona funciones de composición y transformación que se pueden utilizar para trabajar con valores `Option`. También proporciona una sintaxis similar a los Optionals en otros lenguajes de programación.

- ### Riesgos de devolver un valor nulo y cómo establecer valores especiales que representen valores nulos

Devolver un valor nulo, también conocido como `nil` en el lenguaje de programación Ruby, puede tener consecuencias no deseadas y errores difíciles de rastrear en el código. A continuación, se describen algunos de los riesgos asociados con el uso de valores nulos y cómo es mejor establecer valores especiales para representar valores nulos sin serlo.
## 1.- Riesgos de devolver un valor nulo
### Errores de ejecución y de compilación

Si una función devuelve `nil` y otro método espera un valor no nulo, se producirá un error. Por ejemplo, si una función que devuelve un objeto nulo se pasa a un método que espera un objeto, se producirá una excepción de tiempo de ejecución en la línea de código que espera un objeto no nulo. Los errores de compilación también pueden ocurrir si no se comprueba la presencia de un valor nulo antes de utilizarlo en una operación.
### Dificultades para identificar la fuente del error

Si no se maneja adecuadamente la devolución de valores nulos, puede ser difícil identificar la fuente del error. El hecho de que un método devuelva `nil` no necesariamente indica que ese es el origen del error, ya que podría ser que se haya pasado un argumento nulo a la función.
### Código más difícil de leer y mantener

El uso excesivo de valores nulos puede hacer que el código sea más difícil de entender y mantener. Si los valores nulos se propagan por todo el código, puede ser difícil entender qué parte del código es responsable de manejar un valor nulo y cómo se está manejando.
### Establecimiento de valores especiales para representar valores nulos

En lugar de devolver valores nulos, es posible establecer valores especiales para representar valores nulos sin serlo. A continuación se describen algunas estrategias comunes para manejar valores nulos en el código.
### Establecimiento de valores predeterminados

Una estrategia común es establecer valores predeterminados que se utilizan en lugar de valores nulos. Por ejemplo, si una función devuelve un objeto nulo, se puede establecer un valor predeterminado que represente la ausencia de un valor. Esta estrategia puede ser efectiva en casos en los que el valor nulo representa una condición específica, como la ausencia de un valor en una base de datos.
### Lanzamiento de excepciones

En algunos casos, es mejor lanzar una excepción en lugar de devolver un valor nulo. Al lanzar una excepción, se puede asegurar que cualquier problema se detecte y maneje inmediatamente. Esta estrategia también puede ser efectiva en situaciones en las que el valor nulo es inesperado o indica un error.
### Uso de tipos opcionales

En algunos lenguajes de programación, se pueden utilizar tipos opcionales para representar valores nulos. Un tipo opcional indica que una variable puede ser nula o tener un valor específico. Al utilizar tipos opcionales, se obliga a los programadores a manejar explícitamente los valores nulos y se reduce la posibilidad de errores relacionados con la propagación de valores nulos.
## Ejemplo Zodiaco
En el caso de las clases `Persona` y `Zodiaco` presentes en los programas `ZodiacoMal` y `ZodiacoBien`, el uso del valor `nil` para representar fechas de nacimiento inválidas, como el 29 de febrero de un año bisiesto, puede generar problemas en la lógica del programa. En este sentido, `ZodiacoBien` resuelve este problema al establecer un valor especial, como "Desconocido", para representar las fechas de nacimiento inválidas, permitiendo al programa continuar con su ejecución sin generar errores en caso de encontrarse con estas fechas. Esto demuestra la importancia de establecer valores especiales que representen valores nulos sin serlo, para evitar problemas en la lógica y la ejecución del programa.
## 2 - Uso del gem "maybe"

El gem "maybe" es una opción para implementar la funcionalidad de Optionals en Ruby. A continuación, se muestra un ejemplo de cómo utilizar el gem "maybe" para encadenar llamadas a métodos en objetos que pueden ser nulos:

```ruby
# Ejemplo de uso de "maybe"
require 'maybe'

class Person
  attr_accessor :name, :age, :address

  def initialize(name, age, address = nil)
    @name = name
    @age = age
    @address = address
  end
end

person = Person.new("John", 30)

# Encadenamiento de llamadas con "maybe"
person
  .maybe
  .name
  .upcase
  .split("")
  .maybe
  .first
  .maybe
  .downcase
  .maybe
  .tap { |char| puts "La primera letra del nombre es '#{char}'" }
```

En este ejemplo, se crea una clase `Person` con tres atributos: `name`, `age` y `address`. El atributo `address` se inicializa con `nil` para indicar que puede ser nulo.

### ¿Qué hace el código anterior?
Luego, se crea una instancia de la clase `Person` con solo los dos primeros atributos. A continuación, se utiliza el método `maybe` del gem "maybe" para encadenar llamadas a métodos en la instancia de la clase `Person`.
En el encadenamiento de llamadas, se llama al método `name` de la instancia de `Person`, se convierte el nombre en mayúsculas, se divide en caracteres individuales, se toma el primer caracter, se convierte en minúsculas y se imprime por pantalla.

### Gem Maybe
La ventaja de utilizar el gem "maybe" es que simplifica el código al evitar la necesidad de escribir condicionales para verificar si un objeto es nulo o no antes de encadenar llamadas a métodos. En su lugar, se puede utilizar el método `maybe` para manejar automáticamente los objetos nulos y evitar errores de tipo `NoMethodError`.

 ## 3 - Uso del gem "dry-monads"
Supongamos que tenemos una función que devuelve un valor nulo si no se cumple una cierta condición y un valor no nulo en caso contrario. Podemos utilizar el gem "dry-monads" para manejar este caso y trabajar con la opción de manera segura.

```ruby
require 'dry-monads'

def maybe_return_value(condition)
  if condition
    Dry::Monads::Some.new("Valor no nulo")
  else
    Dry::Monads::None()
  end
end

result = maybe_return_value(false)

if result.success?
  puts "El valor es: #{result.value!}"
else
  puts "El valor es nulo"
end
```
 ### ¿Qué hace el código anterior?
En este ejemplo, la función `maybe_return_value` devuelve un objeto de tipo `Dry::Monads::Some` que encapsula el valor "Valor no nulo" si se cumple la condición, o un objeto de tipo `Dry::Monads::None` si no se cumple. Luego, verificamos si el resultado es exitoso utilizando el método `success?` y, si es así, obtenemos el valor utilizando el método `value!`. Si el resultado no es exitoso, es decir, el valor es nulo, simplemente mostramos un mensaje indicando que el valor es nulo.

### Some y None
El uso de `Dry::Monads::Some` y `Dry::Monads::None` nos permite manejar la posibilidad de que el valor sea nulo de manera segura y explícita, evitando errores comunes de null pointer. Además, el gem "dry-monads" proporciona una amplia gama de métodos y operaciones que se pueden utilizar para trabajar con valores Option, como map, bind, unwrap, entre otros.

## 4 - Uso del gem "dry-types"

El gem "kleisli" proporciona una implementación funcional de Optionals. Una de las funciones que ofrece es `Maybe()`, que se utiliza para crear un objeto Maybe a partir de un valor.

```ruby
require 'kleisli/maybe'

def get_user(id)
  # En este ejemplo, se devuelve un objeto User con id 1
  return User.find(id)
end

user = Maybe(get_user(1))
puts user.value_or("El usuario no existe") # Imprime el objeto User
```

En este ejemplo, la función `get_user()` devuelve un objeto User con un id dado. Sin embargo, si no existe un usuario con ese id, se devuelve nil. Para manejar esta situación de manera segura, se utiliza la función `Maybe()` para crear un objeto Maybe a partir del valor devuelto por `get_user()`.

Luego, se utiliza el método `value_or()` del objeto Maybe para obtener el valor si está presente, o un valor predeterminado si no lo está. En este caso, si el objeto User no existe, se imprimirá "El usuario no existe".

El uso de la función `Maybe()` y los métodos proporcionados por el gem "kleisli" permiten trabajar con valores Optionals de manera segura y funcional en Ruby.


Guía de instalación y compilación en Ruby
-----------------------------------------

Para instalar Ruby, se puede utilizar un administrador de paquetes como `apt` (para sistemas operativos basados en Debian) o `yum` (para sistemas operativos basados en Red Hat):

### Instalación de Ruby en sistemas basados en Debian

1.  Abra una terminal.
2.  Ejecute el siguiente comando: `sudo apt update`
3.  Ejecute el siguiente comando: `sudo apt install ruby-full`
4.  Verifique que la instalación haya sido exitosa ejecutando el comando `ruby --version`.

### Instalación de Ruby en sistemas basados en Red Hat

1.  Abra una terminal.
2.  Ejecute el siguiente comando: `sudo yum update`
3.  Ejecute el siguiente comando: `sudo yum install ruby`
4.  Verifique que la instalación haya sido exitosa ejecutando el comando `ruby --version`.

Una vez instalado Ruby, se puede compilar código Ruby utilizando el comando `ruby` seguido del nombre del archivo Ruby. Por ejemplo, si se tiene un archivo llamado `ejemplo.rb`, se puede compilar utilizando el siguiente comando:

```
ruby ejemplo.rb
```

### Creación de un Gemfile

Un Gemfile es un archivo utilizado para especificar las dependencias del proyecto y las versiones de las gemas necesarias. Para crear un Gemfile, se debe seguir los siguientes pasos:

1.  Abra una terminal.
2.  Navegue hasta el directorio del proyecto.
3.  Ejecute el siguiente comando: `touch Gemfile`
4.  Abra el archivo `Gemfile` en un editor de texto y agregue las dependencias necesarias. Para instalar las gemas mencionadas, se puede agregar la siguiente línea al archivo:

```Gemfile
gem 'dry-monads', '~> 0.4.0'
gem 'maybe', '~> 0.1.0'
gem 'kleisli', '~> 0.8.0'
```

5.  Guarde y cierre el archivo.

### Instalación de gemas

Una vez creado el Gemfile, se pueden instalar las gemas necesarias utilizando el siguiente comando en la terminal:

```
bundle install
```

Este comando instalará todas las gemas especificadas en el Gemfile y sus dependencias.

