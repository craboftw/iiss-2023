require 'artii'
require 'rainbow'

module Anuncio
  include Artii
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def anuncio(method_name)
      alias_method "#{method_name}_sin_anuncio", method_name

      define_method method_name do |*args, &block|
        artii = Artii::Base.new :font => 'slant'
        puts Rainbow(artii.asciify("¡Atencion!")).red.bright
        puts artii.asciify("Se va a ejecutar : #{method_name} ")
        if args.all?
          puts Rainbow(artii.asciify("sin  argumentos" ))
        else
        puts artii.asciify("con los argumentos #{args}..." )
        end
        send("#{method_name}_sin_anuncio", *args, &block)
      end
    end
  end
end

#imprimir en color el siguiente texto

class Ejemplo
  include Anuncio

  def metodo_sin_anuncio
    puts "Este es un método sin anuncio"
  end

  def metodo_con_anuncio
    puts "Este es un metodo con anuncio"
  end

  anuncio :metodo_con_anuncio
end

e = Ejemplo.new
e.metodo_sin_anuncio
puts "---------------------"
e.metodo_con_anuncio



