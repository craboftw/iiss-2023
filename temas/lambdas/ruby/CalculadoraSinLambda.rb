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
end

puts "Ejemplos de cada operacion:"
calculadora = Calculadora.new
puts "Suma: #{calculadora.calcular("suma", 2, 3)}"
puts "Resta: #{calculadora.calcular("resta", 2, 3)}"
puts "Multiplicacion: #{calculadora.calcular("multiplicacion", 2, 3)}"
puts "Division: #{calculadora.calcular("division", 2, 3)}"
