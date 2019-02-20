require_relative 'store'

store = Store.new
loop do
  puts "----------------------------------------------------------\n"+
       'CAR STORE-MAIN MENU'+
       "\n----------------------------------------------------------"
  puts 'SELECT AN OPTION'
  puts "\t1. List of vehicles."
  puts "\t2. List of extras."
  puts "\t3. Add new vehicle to the Store."
  puts "\t   Or enter \"quit\" to exit."
  option = gets.chomp

  case option
  when '1'
    store.print_vehicles
  when '2'
    store.print_extras
  when '3'
    puts 'SELECT A TYPE OF VEHICLE'
    puts "\t1. CAR."
    puts "\t2. TRUCK."
    car_type = gets.chomp
    case car_type
    when '1'
       
      print 'Enter the brand: '
      brand = gets.chomp
      print 'Enter the price: '
      price = gets.chomp
      print 'Enter the color: '
      color = gets.chomp
      store.add_vehicle(brand, price.to_f, color)
    when '2'
      print 'Enter the brand: '
      brand = gets.chomp
      print 'Enter the price: '
      price = gets.chomp
      print 'Enter the color: '
      color = gets.chomp
      print 'Enter the amount os wheels: '
      wheels = gets.chomp
      store.add_vehicle(wheels.to_i, brand, price.to_f, color)
    else
      puts 'Invalid type'
    end
  when 'quit'
    puts 'Finishing Program.'
  else
    puts 'Invalid Option'
  end

  break if option == 'quit'
end
