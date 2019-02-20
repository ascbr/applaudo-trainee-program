# Class vehicle
class Vehicle
  attr_accessor :color,
                :brand,
                :price,
                :wheels,
                :type,
                :extras
  def to_s
    puts "Type: #{@type}"
    puts "Color: #{@color}"
    puts "Brand: #{@brand}"
    puts "wheels: #{@wheels}"
    puts "Price: #{@price}"
  end

  def add_extra(extra)
    @extra.push(extra)
  end

  def remove_extra
    if @extra.!empty?
      @extra.delete
    end
  end
  
end
