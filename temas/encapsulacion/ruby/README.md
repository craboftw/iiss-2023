# Encapsulamiento

El **encapsulamiento** se refiere al ocultamiento del estado, es decir, de los datos miembro, de un objeto de manera que sólo se puede cambiar mediante las operaciones definidas para ese objeto.

En el ejemplo siguiente vamos a programar una clase `EstudianteDeLaEsi` que represente a la gente que conozco.

Para ello, vamos a ver previamente los mecanismos que Ruby introduce para la ocultación de la información. Una variable por defecto tiene acceso en su parte privada a la escritura y la lectura como es común. En Ruby, a la hora de declarar variables podemos hacer que las variables tengan un acceso controlado con los siguientes identificadores antes de su declaración:

- `attr_reader`: Variable solo accesible de lectura.
- `attr_writer`: Variable solo accesible de escritura.
- `attr_accessor`: Variable accesible de ambas formas.

Si queremos hacer una variable privada simplemente la escribimos sin ningún identificador.

```ruby
class EstudianteDeLaEsi
  attr_accessor :Nombre #El que recordemos de esa persona
  attr_reader :SignodelZodiaco, :Generacion #Importante
  attr_writer :Interacciones #Numero de interacciones
  :Amigo #Es o no es nuestro amigo
  # ...
end
```

Igualmente aunque establezcamos estas limitaciones podemos saltarlas si sobrecargamos operadores que lo permitan. Esto se utiliza para realizar asignaciones que requieran de un procesado, o para devolver una variable de una manera procesada y no de la manera en la que estan almacenadas.

Por ejemplo, vamos a hacer que podamos cambiar su signo del zodiaco a partir de usar el operador de asignacion con una cadena que contenga su fecha de cumpleaños y que en vez de devolver cuantas veces interactua con nosotros devuelva una cadena que indique que tal nos cae, si es nuestro amigo y interactua mucho sera genial pero de lo contrario sera alguien pesado.

```ruby
class EstudianteDeLaEsi
#...
 def SignodelZodiaco= (fecha)
    dia, mes, @Generacion = fecha.split('/').map {|s| s.to_i }
    puts "Fecha: #{dia}/#{mes}/#{@Generacion}"
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
#...
  ```
