class EstudianteDeLaEsi
  attr_accessor :Apodo #El que recordemos de esa persona
  attr_reader :SignodelZodiaco, :Generacion #Importante
  attr_writer :Interacciones #Numero de interacciones
  :Amigo #Es o no es nuestro amigo

    def initialize(nombre, amigo, interacciones)
      @Apodo = nombre
      @Amigo = amigo
      @SignodelZodiaco = "Desconocido"
      @Interacciones = interacciones
    end


  def SignodelZodiaco= (fecha)
    dia, mes, @Generacion = fecha.split('/').map {|s| s.to_i }
    case mes
    when 1
      signo = dia <= 20 ? 'Capricornio' : 'Acuario'
    when 2
      signo = dia <= 19 ? 'Acuario' : 'Piscis'
    when 3
      signo = dia <= 20 ? 'Piscis' : 'Aries'
    when 4
      signo = dia <= 20 ? 'Aries' : 'Tauro'
    when 5
      signo = dia <= 21 ? 'Tauro' : 'Géminis'
    when 6
      signo = dia <= 21 ? 'Géminis' : 'Cáncer'
    when 7
      signo = dia <= 23 ? 'Cáncer' : 'Leo'
    when 8
      signo = dia <= 23 ? 'Leo' : 'Virgo'
    when 9
      signo = dia <= 23 ? 'Virgo' : 'Libra'
    when 10
      signo = dia <= 23 ? 'Libra' : 'Escorpio'
    when 11
      signo = dia <= 22 ? 'Escorpio' : 'Sagitario'
    when 12
      signo = dia <= 21 ? 'Sagitario' : 'Capricornio'
    else
      raise "Fecha inválida: #{fecha}"
    end
    @SignodelZodiaco = signo
  end

    #frases escritas por chatgpt.
    def interacciones
      if @amigo
        case @interacciones
          when 0..10
            "Tiene pocas interacciones, pero siempre son muy agradables."
          when 11..50
            "Es un buen amigo con el que da gusto interactuar."
          when 51..100
            "¡Qué amigo más genial! Siempre da gusto hablar con él."
          else
            "¡Es el mejor amigo que uno puede tener! Cada interacción es una experiencia inolvidable."
        end
      else
        case @interacciones
          when 0..10
            "No le conozco demasiado, pero parece una persona amable."
          when 11..50
            "Parece que quiere ser amigo, pero sus constantes interacciones pueden resultar un poco agotadoras."
          when 51..100
            "¡Es un poco pesado! No para de interactuar y a veces no tengo tiempo para tanto."
          else
            "Es un auténtico pelmazo. ¿No tiene vida propia? Me está acosando con tanta interacción."
        end
      end
    end
end

def QueOpinoDe(persona)
  if persona.is_a?(EstudianteDeLaEsi)
    puts "#{persona.Apodo} es #{persona.SignodelZodiaco} de la generación del #{persona.Generacion}. #{persona.interacciones}"
  end
end


Sergio = EstudianteDeLaEsi.new("Sergio", false, 101)
Sergio.SignodelZodiaco=("19/12/1996")

QueOpinoDe(Sergio)

