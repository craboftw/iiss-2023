#Se denomina encapsulamiento al ocultamiento del estado, es decir, de los datos miembro,
#de un objeto de manera que sólo se puede cambiar mediante las operaciones definidas para ese objeto.


class AnimalEnfermo
  attr_accessor :nombre, :edad

    #Vamos a programar un getter de la variable vacunas por ejemplo

#Getter de vacunas de la manera mas parecida a c posible seria
#  def vacunas
#    @vacunas
#  end

#En ruby por suerte tenemos formas rapidas de lograr estos mecanismos.

attr_reader :vacuna

  #Getter de vacunas de la manera mas parecida a c posible seria
#  def vacunas=(vacunas)
#    @vacunas=vacunas
#  end

 #En ruby podemos lograr sobrecargar el operador = de la siguiente forma
# attr_writer :vacuna

#tenemos disponibles estos 3 mecanismos para controlar el acceso.
#attr_accessor
#attr_reader
#attr_writer

#Con esto podriamos ahorrarnos el set y el get haciendo accesibles a lectura o escrtura la variable.
#Con esto perdemos la posiblidad de hacer un asignacion mas procesada pero acelera el proceso de escritura.


  #constructor
  def initialize(nombre, patas)
    @nombre = nombre
    @patas = patas
    @vacunas = 0
    @listavacunas = []
  end


  def vacunar(vacuna)
    comprobar_vacunacion(vacuna)
  end

  private

#implementacion de comprobar la vacunacion.
  def comprobar_vacunacion(vacuna)
    if @listavacunas.index("#{vacuna}").nil?
      @listavacunas.push("#{vacuna}")
      @vacunas = @vacunas +1
      puts "Vacunado de la siguiente vacuna: #{vacuna}, tiene #{vacunas} vacunas."
    else
      puts "Ya está vacunado de #{vacuna}"
    end
  end
end


class AnimalEnfermo2
    attr_accessor :nombre, :patas

    def initialize(nombre, patas)
      @nombre = nombre
      @patas = patas
      @listavacunas = ""
    end

    def vacunas
      @listavacunas.count(",")
    end

    def vacunar(vacuna)
      comprobar_vacunacion(vacuna)
    end

    private
    def comprobar_vacunacion(vacuna)
      if !(@listavacunas.include?("#{vacuna}"))
        @listavacunas += "#{vacuna},"
        puts "Vacunado de la siguiente vacuna: #{vacuna}, tiene #{@listavacunas.count(",")} vacunas."
      else
        puts "Ya está vacunado de #{vacuna}"
      end

    end
  end

  #La encapsulacion no es lo mismo que la ocultacion de informacion pero es un mecanismo que abstrae la informacion
  #Al estar el contenido encapsulado en una clase pero conocerse su forma de usar se consigue abstraer el uso de la implementacion.


humano = AnimalEnfermo.new("Manolo", 2)
humano.vacunar("moderna")
humano.vacunar("moderna")
puts("El numero de vacunas es: #{humano.vacunas}")
humano.vacunar("antigua")
puts("El numero de vacunas es: #{humano.vacunas}")

