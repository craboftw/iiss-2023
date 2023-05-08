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

puts "Ejemplos de cada operacion:"
calculadora = Calculadora.new
puts "Suma: #{calculadora.calcular("suma", 2, 3)}"
puts "Resta: #{calculadora.calcular("resta", 2, 3)}"
puts "Multiplicacion: #{calculadora.calcular("multiplicacion", 2, 3)}"
puts "Division: #{calculadora.calcular("division", 2, 3)}"
