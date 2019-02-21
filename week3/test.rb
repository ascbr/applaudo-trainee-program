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
  puts "\t4. Remove a vehicle from the Store."
  puts "\t5. Add an Extra to a vehicle."
  puts "\t6. Remove an Extra from a vehicle."
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
  when '4'
    print 'Enter the id: '
    id = gets.chomp
    vehicle = store.select_vehicle(id)
    if vehicle.nil?
      puts 'Vehicle not found.'
    else
      puts '=================================================='
      puts vehicle.to_s
      print 'you sure you want to remove the Vehicle? '
      confirm = gets.chomp
      if confirm == 'y'
        store.remove_vehicle(vehicle)
        puts 'Removed from store.'
      else
        puts 'Remove operation canceled'
      end
    end
  when '5'
    puts 'Enter the id: '
    id = gets.chomp
    vehicle = store.select_vehicle(id)
    if vehicle.nil?
      puts 'Vehicle not found.'
    else
      puts '=================================================='
      puts vehicle.to_s
      store.print_extras
      puts "Enter name to add exra to be added to #{vehicle.type} - #{vehicle.id}"
      extra_name = gets.chomp
      extra = store.find_extra(extra_name)
      if !extra.nil?
       vehicle.add_extra(extra)
      else
        puts 'Extra not found'
      end
    end
  when '6'
    puts 'Enter the id: '
    id = gets.chomp
    vehicle = store.select_vehicle(id)
    if vehicle.nil?
      puts 'Vehicle not found.'
    else
      puts vehicle.to_s
      store.print_extras
      puts "Enter name to add exra to be remove form: #{vehicle.type} - #{vehicle.id}"
      extra_name = gets.chomp
      extra = vehicle.find_extra_in_vehicle(extra_name)
      if !extra.nil?
        vehicle.remove_extra(extra)
      else
        puts 'Extra not found'
      end
    end

  when 'quit'
    puts 'Finishing Program.'
  else
    puts 'Invalid Option'
  end

  break if option == 'quit'
end
