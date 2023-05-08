require './Employee.rb'

# Creamos una lista de empleados
employees = [
  Employee.new("Violeta", 25, 2000),
  Employee.new("Tomi", 35, 3000),
  Employee.new("Miriam", 30, 2500),
  Employee.new("Ivan", 28, 2200),
  Employee.new("Lucia", 45, 4000),
  Employee.new("Pakito", 23, 5000)
]

# Seleccionamos los empleados cuyo salario es mayor a $2500 utilizando una lambda
selected_by_salary = employees.select { |e| e.salary > 2500 }
puts "Empleados con salario mayor a $2500:"
selected_by_salary.each { |e| puts "#{e.name} - #{e.age} años - $#{e.salary}" }
puts "\n"
