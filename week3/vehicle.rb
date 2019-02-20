# Class vehicle
class Vehicle
  attr_accessor :id,
                :color,
                :brand,
                :price,
                :wheels,
                :type,
                :extras
  def to_s
    puts "\t#{@type} ID: #{@id}\n"
    puts "\tFeautres:"
    puts "\n\tColor: \t#{@color}"
    puts "\tBrand: \t#{@brand}"
    puts "\twheels:\t#{@wheels}"
    puts "\tPrice: \t$ #{@price.round(2)}"
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
