require_relative 'vehicle'
# class truck
class Truck < Vehicle
  def intialize(wheels, brand, price, color)
    @wheels = wheels
    @brand = brand
    @color = color
    @price = price
  end
end
