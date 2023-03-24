# Esta clase representa a un alumno que toma exámenes y puede hacer trampas para aprobarlos.
class Alumno
  # Inicializa un nuevo objeto Alumno con el nombre y la edad dados.
  #
  # @param [String] nombre el nombre del alumno
  # @param [Integer] edad la edad del alumno
  def initialize(nombre, edad)
    @nombre = nombre
    @edad = edad
    @examen_aprobado = false
  end

  # Toma el examen dado y devuelve si lo ha aprobado o no.
  #
  # @param [Examen] examen el examen que el alumno está tomando
  # @return [Boolean] true si el alumno ha aprobado el examen, false en caso contrario
  # @raise [ExcepcionDeTrampa] si el alumno ha sido atrapado haciendo trampa
  def tomar_examen(examen)
    if examen.responder_preguntas and not hizo_trampa?
      @examen_aprobado = true
    else
      hacer_trampa
    end

    return @examen_aprobado
  end

  # Devuelve el nombre del alumno.
  #
  # @return [String] el nombre del alumno
  def nombre
    @nombre
  end

  # Devuelve la edad del alumno.
  #
  # @return [Integer] la edad del alumno
  def edad
    @edad
  end

  private

  # Devuelve si el alumno ha hecho trampa o no.
  #
  # @return [Boolean] true si el alumno ha hecho trampa, false en caso contrario
  def hizo_trampa?
    return @hizo_trampa
  end

  # Hace que el alumno haga trampa y lanza una excepción de trampa.
  #
  # @raise [ExcepcionDeTrampa] siempre se lanza esta excepción
  def hacer_trampa
    @hizo_trampa = true
    raise ExcepcionDeTrampa, "El alumno #{@nombre} ha sido atrapado haciendo trampa."
  end
end

# Esta clase representa un examen que puede ser tomado por un alumno.
class Examen
  # Inicializa un nuevo objeto Examen con el número de preguntas y el número de respuestas correctas dados.
  #
  # @param [Integer] num_preguntas el número total de preguntas en el examen
  # @param [Integer] num_respuestas_correctas el número de respuestas correctas en el examen
  def initialize(num_preguntas, num_respuestas_correctas)
    @num_preguntas = num_preguntas
    @num_respuestas_correctas = num_respuestas_correctas
  end

  # Devuelve si el alumno ha respondido correctamente al menos la mitad de las preguntas.
  #
  # @return [Boolean] true si el alumno ha respondido correctamente al menos la mitad de las preguntas, false en caso contrario
  def responder_preguntas
    num_respuestas_incorrectas = @num_preguntas / 2
    num_respuestas_correctas = @num_respuestas_correctas

    if num_respuestas_correctas >= (@num_preguntas / 2)
      return true
    else
      return false
    end
end


# Esta clase representa una excepción que se lanza cuando un alumno hace trampa en un examen.
class ExcepcionDeTrampa < StandardError
end

# Crear un nuevo examen
examen = Examen.new(10, 6)

# Crear un nuevo alumno
alumno = Alumno.new("Juan", 20)

# El alumno toma el examen
begin
  resultado = alumno.tomar_examen(examen)
  if resultado
    puts "#{alumno.nombre} ha aprobado el examen!"
  else
    puts "#{alumno.nombre} ha reprobado el examen."
  end
rescue ExcepcionDeTrampa => e
  puts e.message
end
  end
