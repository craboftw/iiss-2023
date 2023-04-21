require 'concurrent'

# Función para generar un vector aleatorio de n elementos
def generar_vector(n)
  vector = []
  n.times { vector << rand(100) }
  vector
end

# Algoritmo de ordenación Burbuja (secuencial)
def burbuja(vector)
  n = vector.length
  loop do
    intercambio = false
    (n - 1).times do |i|
      if vector[i] > vector[i + 1]
        vector[i], vector[i + 1] = vector[i + 1], vector[i]
        intercambio = true
      end
    end
    break unless intercambio
  end
end

# Algoritmo de ordenación QuickSort (concurrente)
def quicksort(vector)
  return vector if vector.length <= 1

  pivot = vector.sample
  left = []
  right = []
  equal = []

  vector.each do |x|
    if x < pivot
      left << x
    elsif x > pivot
      right << x
    else
      equal << x
    end
  end

  executor = Concurrent::FixedThreadPool.new(2)
  left_future = Concurrent::Future.execute(executor: executor) { quicksort(left) }
  right_future = Concurrent::Future.execute(executor: executor) { quicksort(right) }

  left = left_future.value
  right = right_future.value

  executor.shutdown

  left + equal + right
end


# Vectores pequeños (20 elementos)
puts "Vectores pequeños (20 elementos):\n"

puts "Presiona ENTER para comenzar con Burbuja"
gets # Espera a que el usuario presione ENTER

vector_desorden = generar_vector(20)
vector = vector_desorden.dup

tiempo_inicio = Time.now
burbuja(vector)
tiempo_fin = Time.now
tiempo_total = tiempo_fin - tiempo_inicio

puts "El algoritmo Burbuja (secuencial) tardó #{tiempo_total} segundos en ordenar el vector"

puts "Presiona ENTER para continuar con QuickSort"
gets # Espera a que el usuario presione ENTER

vector = vector_desorden.dup

tiempo_inicio = Time.now
quicksort(vector)
tiempo_fin = Time.now
tiempo_total = tiempo_fin - tiempo_inicio

puts "El algoritmo QuickSort (concurrente) tardó #{tiempo_total} segundos en ordenar el vector"
puts ""

# Vectores medianos (2000 elementos)
puts "Vectores medianos (2000 elementos):\n"

puts "Presiona ENTER para comenzar con Burbuja"
gets # Espera a que el usuario presione ENTER

vector_desorden = generar_vector(2000)
vector = vector_desorden.dup

tiempo_inicio = Time.now
burbuja(vector)
tiempo_fin = Time.now
tiempo_total = tiempo_fin - tiempo_inicio

puts "El algoritmo Burbuja (secuencial) tardó #{tiempo_total} segundos en ordenar el vector"

puts "Presiona ENTER para continuar con QuickSort"
gets # Espera a que el usuario presione ENTER

vector = vector_desorden.dup

tiempo_inicio = Time.now
quicksort(vector)
tiempo_fin = Time.now
tiempo_total = tiempo_fin - tiempo_inicio

puts "El algoritmo QuickSort (concurrente) tardó #{tiempo_total} segundos en ordenar el vector"
puts ""

# Vectores grandes (20000 elementos)
puts "Vectores grandes (20000 elementos):\n"

puts "Presiona ENTER para comenzar con Burbuja"

vector_desorden = generar_vector(20000)

vector = vector_desorden.dup

tiempo_inicio = Time.now

burbuja(vector)

tiempo_fin = Time.now

tiempo_total = tiempo_fin - tiempo_inicio

puts "El algoritmo Burbuja (secuencial) tardó #{tiempo_total} segundos en ordenar el vector"

puts "Presiona ENTER para continuar con QuickSort"

vector = vector_desorden.dup

tiempo_inicio = Time.now

quicksort(vector)

tiempo_fin = Time.now

tiempo_total = tiempo_fin - tiempo_inicio

puts "El algoritmo QuickSort (concurrente) tardó #{tiempo_total} segundos en ordenar el vector"

puts ""

