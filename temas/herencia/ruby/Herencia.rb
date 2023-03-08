#Funcion que explique todos los mecanismos de herencia de ruby

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

a1 = Alumno.new("Francisco", 18, "Masculino", 11)
p1 = Profesor.new("Paco", 30, "Masculino", "Discreta")
d1 = Director.new("Carmina", 19, "Femenino", "Informatica")

puts a1
puts p1
puts d1
