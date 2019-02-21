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
    puts "\tFeatures:"
    puts "\n\tColor: \t#{@color}"
    puts "\tBrand: \t#{@brand}"
    puts "\twheels:\t#{@wheels}"
    puts "\tPrice: \t$ #{@price.round(2)}"
    if @extras != nil
      puts '--------------------------------------------------------'
      @extras.each do |e|
        puts e.to_s
      end
    end
  end

  def add_extra(extra)
    @extras.push(extra)
  end

  def remove_extra(extra)
    @extras.delete(extra)
  end

end
