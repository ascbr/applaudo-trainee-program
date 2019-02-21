require_relative 'vehicle'
require 'securerandom'
# Class Car
class Car <  Vehicle
  def initialize(brand, price, color)
    @id = SecureRandom.uuid
    @type = 'Car'
    @wheels = 4
    @brand = brand
    @color = color
    @price = price
    @extras = []
  end
end
