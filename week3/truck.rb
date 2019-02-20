require_relative 'vehicle'
# class truck
class Truck < Vehicle
  def initialize(wheels, brand, price, color)
    @type = 'Truck'
    if(wheels > 4 && wheels%2 == 0)
      @wheels = wheels
    else
      @wheels = 6
    end
    @brand = brand
    @color = color
    @price = price
  end
end
