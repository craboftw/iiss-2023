# Definimos una función lambda que toma un número como argumento y lo eleva al cuadrado
elevar_al_cuadrado = lambda { |numero| numero ** 2 }

# Definimos una función que toma un array y una función lambda como argumentos, y devuelve un nuevo array con cada elemento transformado por la función lambda
def transformar_array(array, funcion_lambda)
  resultado = []
  array.each do |elemento|
    resultado << funcion_lambda.call(elemento)
  end
  resultado
end

# Probamos la función transformar_array con el array [1, 2, 3, 4] y la función lambda elevar_al_cuadrado
puts transformar_array([1, 2, 3, 4], elevar_al_cuadrado).inspect
# Output: [1, 4, 9, 16]
