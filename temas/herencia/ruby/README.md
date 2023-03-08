## Herencia en Ruby

La herencia es un mecanismo de programación orientada a objetos que permite definir nuevas clases basadas en clases ya existentes. En Ruby, la herencia se logra mediante la palabra clave `class`, seguida del nombre de la nueva clase y del nombre de la clase padre (o superclase) de la que hereda.

En el código proporcionado, podemos ver varios ejemplos de herencia en Ruby. La clase `Alumno`, `Profesor` y `Director` son subclases de la clase `Persona`, lo que significa que heredan los atributos y métodos de `Persona` y también pueden agregar sus propios atributos y métodos.

```ruby
class Persona
attr_accessor :nombre, :edad, :sexo
def initialize(nombre, edad, sexo)
@nombre = nombre
@edad = edad
@sexo = sexo
end
def to_s
"Nombre: #{@nombre}, Edad: #{@edad}, Sexo: #{@sexo}"
end
end

class Alumno < Persona
attr_accessor :nota
def initialize(nombre, edad, sexo, nota)
super(nombre, edad, sexo)
@nota = nota
end
def to_s
super + ", Nota: #{@nota}"
end
end

class Profesor < Persona
attr_accessor :asignatura
def initialize(nombre, edad, sexo, asignatura)
super(nombre, edad, sexo)
@asignatura = asignatura
end
def to_s
super + ", Asignatura: #{@asignatura}"
end
end

class Director < Persona
  attr_accessor :grado
def initialize(nombre, edad, sexo, grado)
super(nombre, edad, sexo)
@grado = grado
end
def to_s
super + ", Grado: #{@grado}"
end
end
```


La subclase `Alumno` tiene un atributo adicional `nota` y la subclase `Profesor` tiene un atributo adicional `asignatura`. La subclase `Director` también tiene un atributo adicional `grado`.

La herencia en Ruby se implementa mediante el método `super()`, que permite llamar a los métodos de la superclase. En los métodos `initialize` de las subclases, se llama al método `super()` para inicializar los atributos heredados de la superclase.

Además, Ruby proporciona los atributos de acceso `attr_accessor`, `attr_reader` y `attr_writer`, que se utilizan para definir atributos de instancia y generar automáticamente los métodos de lectura y escritura necesarios.

En el código proporcionado, podemos ver que las subclases `Alumno`, `Profesor` y `Director` usan `attr_accessor` para definir sus atributos adicionales y heredan los atributos `nombre`, `edad` y `sexo` de la superclase `Persona`.

La herencia en Ruby es un mecanismo poderoso que permite reutilizar el código y agregar nuevas funcionalidades a las clases existentes. Al utilizar los atributos de acceso y el método `super()`, es posible crear subclases que hereden los atributos y métodos de la superclase.
