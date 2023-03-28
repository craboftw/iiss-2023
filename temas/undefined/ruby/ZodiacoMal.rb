class Persona
  attr_accessor :nombre, :fecha_nacimiento

  def initialize(nombre, fecha_nacimiento)
    @nombre = nombre
    @fecha_nacimiento = fecha_nacimiento
  end

  def signo_zodiaco
    if @fecha_nacimiento.month == 2 && @fecha_nacimiento.day == 29
      return nil
    end

    dia = @fecha_nacimiento.day
    mes = @fecha_nacimiento.month

    case mes
    when 1 # Enero
      dia <= 20 ? "Capricornio" : "Acuario"
    when 2 # Febrero
      dia <= 19 ? "Acuario" : "Piscis"
    when 3 # Marzo
      dia <= 20 ? "Piscis" : "Aries"
    when 4 # Abril
      dia <= 20 ? "Aries" : "Tauro"
    when 5 # Mayo
      dia <= 21 ? "Tauro" : "Géminis"
    when 6 # Junio
      dia <= 21 ? "Géminis" : "Cáncer"
    when 7 # Julio
      dia <= 23 ? "Cáncer" : "Leo"
    when 8 # Agosto
      dia <= 23 ? "Leo" : "Virgo"
    when 9 # Septiembre
      dia <= 23 ? "Virgo" : "Libra"
    when 10 # Octubre
      dia <= 23 ? "Libra" : "Escorpio"
    when 11 # Noviembre
      dia <= 22 ? "Escorpio" : "Sagitario"
    else # Diciembre
      dia <= 21 ? "Sagitario" : "Capricornio"
    end
  end

  def imprimir_signo_zodiaco
    signo = signo_zodiaco
    if signo.nil?
      puts "#{nombre} tiene un signo desconocido para la ciencia moderna"
    else
      puts "#{nombre} es del signo #{signo}"
    end
  end
end
