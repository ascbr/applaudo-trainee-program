require_relative 'car'
require_relative 'truck'
require_relative 'extra'
#store 
class Store
  attr_accessor :vehicles, :extras
  
  def brands_array
    @@ram_brand =['Mitubihshi', 'Toyota', 'Nissan', 'Ford', 'BMW'].sample
  end

  def colors_array
    @@ram_color =['black', 'white', 'blue', 'red', 'gray'].sample
  end

  def ram_price
    prng = Random.new
    @@ram_price = prng.rand(5000.0..15000.0)
  end

  def ram_wheels_truck
    prng = Random.new
    @@ram_wheels = prng.rand(6..12)
  end

  def initialize
    @vehicles = []
    @extras = []
    5.times do
      brands_array
      colors_array
      ram_price

      new_car = Car.new(@@ram_brand, @@ram_price, @@ram_color)
      @vehicles << new_car

      brands_array
      colors_array
      ram_price
      ram_wheels_truck

      new_truck = Truck.new(@@ram_wheels, @@ram_brand, @@ram_price, @@ram_color)
      @vehicles << new_truck

    end
    @extras << Extra.new('Radio', 100.0)
    @extras << Extra.new('AC', 500.0)
    @extras << Extra.new('Leather Seats', 900.0)
    @extras << Extra.new('Sunroof', 300.0)
    @extras << Extra.new('Power windows', 650.0)
  end

  def print_vehicles
    puts 'AVAILABLE VEHICLES:'
    puts '=========================================================='
    @vehicles.each do |e|
      puts e.to_s
      puts '=========================================================='
    end
  end

  def print_extras
    puts 'AVAILABLE EXTRAS:'
    puts '=========================================================='
    @extras.each do |e|
      puts e.to_s
    end
  end

  def add_vehicle(* args)
    puts args.size
    case args.size
    when 3
      car = Car.new(args[0], args[1], args[2])
      @vehicles << car
    when 4
      truck = Truck.new(args[0], args[1], args[2], args[3])
      @vehicles << truck
    end
  end

  add 
end
