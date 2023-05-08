require './Employee.rb'

employees = [
  Employee.new("Violeta", 25, 2000),
  Employee.new("Tomi", 35, 3000),
  Employee.new("Miriam", 30, 2500),
  Employee.new("Ivan", 28, 2200),
  Employee.new("Lucia", 45, 4000),
  Employee.new("Pakito", 23, 5000)

]

# Mapeamos la lista de empleados a una lista de hashes que contienen solo el nombre y el salario
employee_info = employees.map { |e| [e.name,e.salary] }.to_h

puts "Información de empleados:"
puts employee_info.inspect
puts "\n"

# Mapeamos la lista de empleados a una lista de hashes que contienen solo el nombre y el doble del salario
employee_info_with_double_salary = employees.map { |e| [e.name,e.salary*2] }.to_h
puts "Información de empleados con doble salario:"
puts employee_info_with_double_salary.inspect
puts "\n"

#Uso de map para obtener los salarios de un empleado en particular
puts "Violeta ahora mismo gana: #{employee_info["Violeta"]} €"
puts "Si violeta tuviera el doble de su salario ganaria: #{employee_info_with_double_salary["Violeta"] } €"
