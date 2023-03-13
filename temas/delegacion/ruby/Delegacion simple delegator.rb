#Funcion que muestre como funciona SimpleDelegator

require 'delegate'
class Memoria
  def initialize
    @data = []
  end
  def escribir(datos)
    @data << datos
  end
  def leer(i)
    @data[i]
  end
end


class Ordenador < SimpleDelegator
end

ordenador = Ordenador.new(Memoria.new)
ordenador.escribir("Hola")
puts ordenador.leer(0)

