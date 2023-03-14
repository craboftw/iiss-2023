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

class Ordenador
  def initialize
    @memoria = Memoria.new
  end
  def escribir(data)
    @memoria.escribir(data)
  end
  def leer(i)
    @memoria.leer(i)
  end
end


require 'forwardable'
class Ordenador
  extend Forwardable
  def_delegators :@memoria, :leer, :escribir
  def initialize
    @memoria = Memoria.new
  end
end

ordenador = Ordenador.new
ordenador.escribir("Hola")
puts ordenador.leer(0)

