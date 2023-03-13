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


class Ordenador < Delegator

  def_delegators :@Memoria :leer, :escribir

end

ordenador = Ordenador.new(Memoria.new)
ordenador.escribir("Hola")
puts ordenador.leer(0)


#Function that makes a dictionary of people using id as a key
