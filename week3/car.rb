require_relative 'vehicle'
# Class Car
class Car <  Vehicle
  def initialize(brand, price, color)
    @type = 'Car'
    @wheels = 4
    @brand = brand
    @color = color
    @price = price
  end
 
end
