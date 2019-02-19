require_relative 'vehicle'
# Class Car
class Car <  Vehicle
  def initialize(brand, price, color)
    @wheels = 4
    @brand = brand
    @color = color
    @price = price
  end

  def to_s
    puts "Color: #{@color}"
    puts "Brand: #{@brand}"
    puts "wheels: #{@wheels}"
    puts "Price: #{@price}"
  end
end
