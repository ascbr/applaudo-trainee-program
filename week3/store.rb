require_relative 'car'
require_relative 'truck'
#store 
class Store
  attr_accessor :vehicles, :extras
  def brands_array
    @@brands_array =['Mitubihshi', 'Toyota', 'Nissan', 'Ford', 'BMW'] 
  end

  def colors_array
    @@colors_array =['black', 'white', 'blue', 'red', 'gray']
  end

 
  def initialize
    5.times do

    end
  end

  
end