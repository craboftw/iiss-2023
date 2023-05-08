# Definimos la clase ONGSystem
class ONGSystem
  # Constructor que inicializa un array vacío para almacenar las donaciones
  def initialize
    @donations = []
  end

  # Método que recibe el nombre y cantidad de la donación y la guarda en el array de donaciones
  def donate(name, amount)
    donation = {
      name: name,
      amount: amount,
      date: Time.now
    }
    @donations << donation
  end

  # Método que calcula la suma total de todas las donaciones registradas en el array y devuelve un string con el resultado
  def total_donations
    total = @donations.reduce(0) {|sum, donation| sum + donation[:amount]}
    "Total donations: $#{total}"
  end

  # Método que calcula el promedio de las donaciones registradas en el array y devuelve un string con el resultado
  def average_donation
    total = @donations.reduce(0) {|sum, donation| sum + donation[:amount]}
    average = total / @donations.length
    "Average donation: $#{average}"
  end

  # Método que agrupa las donaciones por fecha y devuelve un hash donde la clave es la fecha y el valor es la suma de las donaciones de ese día
  def donations_by_date
    donations_by_date = {}
    @donations.each do |donation|
      date = donation[:date].strftime("%Y-%m-%d")
      if donations_by_date[date]
        donations_by_date[date] += donation[:amount]
      else
        donations_by_date[date] = donation[:amount]
      end
    end
    donations_by_date
  end

  # Método que devuelve el total de donaciones en un rango de fechas especificado y devuelve un string con el resultado
  def donations_by_date_range(start_date, end_date)
    filtered_donations = @donations.select do |donation|
      donation_date = donation[:date].strftime("%Y-%m-%d")
      donation_date >= start_date && donation_date <= end_date
    end
    total = filtered_donations.reduce(0) {|sum, donation| sum + donation[:amount]}
    "Total donations between #{start_date} and #{end_date}: $#{total}"
  end

  # Método que genera un reporte con información resumida de las donaciones registradas y devuelve un string con el resultado
  def generate_report
    report = ""
    report += "#{total_donations}\n"
    report += "#{average_donation}\n"
    report += "Donations by date:\n"
    donations_by_date.each do |date, total|
      report += "#{date}: $#{total}\n"
    end
    report
  end
end

# Definimos una clase ONGInterface
class ONGcliente
  # Creamos una instancia de ONGSystem, y definimos las acciones que se pueden realizar
  def initialize
    # Creamos una instancia de ONGSystem
    @ong_system = ONGSystem.new
    # Definimos la acción de donar
    @donate_lambda = -> {
      puts "Enter your name: ";
      name = gets.chomp;
      puts "Enter the amount you want to donate: ";
      amount = gets.chomp.to_i;
      @ong_system.donate(name, amount)
    }
    # Definimos la acción de reporte
    @report_lambda = -> { puts @ong_system.generate_report }
    # Definimos la acción de salir
    @exit_lambda = -> { puts "Goodbye!"; exit }
    # Definimos las opciones que se pueden realizar, cada opción tiene un nombre y una lambda asociada
    @options = [
      { name: "Donate", lambda: @donate_lambda },
      { name: "Report", lambda: @report_lambda },
      { name: "Exit", lambda: @exit_lambda }
    ]
  end

  # Imprimimos las opciones disponibles
  def print_options
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option[:name]}"
    end
  end

  # Ejecutamos el programa
  def run
    puts "Welcome to the ONG System"
    while true
      puts "What do you want to do?"
      print_options
      option = gets.chomp.to_i - 1
      if (0...@options.length).include?(option)
        @options[option][:lambda].call
      else
        puts "Invalid option"
      end
    end
  end
end

# Creamos una instancia de ONGInterface y ejecutamos el programa
ONGcliente.new.run
