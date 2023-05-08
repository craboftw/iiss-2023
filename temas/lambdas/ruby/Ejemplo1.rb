require './Employee.rb'

# Creamos una lista de empleados desordenada
employees = [
  Employee.new("Violeta", 25, 2000),
  Employee.new("Tomi", 35, 3000),
  Employee.new("Miriam", 30, 2500),
  Employee.new("Ivan", 28, 2200),
  Employee.new("Lucia", 45, 4000),
  Employee.new("Pakito", 23, 5000)

]

# Ordenamos la lista por nombre (orden alfabético ascendente)
ordered_by_name = employees.sort_by { |e| e.name }
puts "Empleados ordenados por nombre:"
ordered_by_name.each { |e| puts "#{e.name} - #{e.age} años - $#{e.salary}" }
puts "\n"

# Ordenamos la lista por edad (orden numérico ascendente)
ordered_by_age = employees.sort_by { |e| e.age }
puts "Empleados ordenados por edad:"
ordered_by_age.each { |e| puts "#{e.name} - #{e.age} años - $#{e.salary}" }
puts "\n"

# Ordenamos la lista por salario (orden numérico descendente)
ordered_by_salary = employees.sort_by { |e| -e.salary }
puts "Empleados ordenados por salario:"
ordered_by_salary.each { |e| puts "#{e.name} - #{e.age} años - $#{e.salary}" }
puts "\n"

# Ordenamos la lista por nombre, y en caso de empate, por edad (orden alfabético y numérico ascendente)
ordered_by_name_and_age = employees.sort do |a, b|
  if a.name == b.name
    a.age <=> b.age
  else
    a.name <=> b.name
  end
end

puts "Empleados ordenados por nombre y edad:"
ordered_by_name_and_age.each { |e| puts "#{e.name} - #{e.age} años - $#{e.salary}" }
puts "\n"
