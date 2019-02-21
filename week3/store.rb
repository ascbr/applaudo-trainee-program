require_relative 'car'
require_relative 'truck'
require_relative 'extra'
#store 
class Store
  attr_accessor :vehicles, :extras
  
  def self.brands_array
    @ran_brand =['Mitubihshi', 'Toyota', 'Nissan', 'Ford', 'BMW'].sample
  end

  def self.colors_array
    @ran_color =['black', 'white', 'blue', 'red', 'gray'].sample
  end

  def self.ran_price
    prng = Random.new
    @ran_price = prng.rand(5000.0..15000.0)
  end

  def self.ran_wheels_truck
    prng = Random.new
    @ran_wheels = prng.rand(6..12)
  end

  def initialize
    @vehicles = []
    @extras = []
    5.times do

      new_car = Car.new(self.class.brands_array, self.class.ran_price, self.class.colors_array)
      @vehicles << new_car

      new_truck = Truck.new(self.class.ran_wheels_truck, self.class.brands_array, self.class.ran_price, self.class.colors_array)
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

  def select_vehicle(id)
    found = @vehicles.select { |v| v.id == id }
    found[0]
  end

  def remove_vehicle(vehicle_to_remove)
    @vehicles.delete(vehicle_to_remove)
  end

  def find_extra(name)
    found = @extras.select { |e| e.name == name }
    found[0]
  end

end
