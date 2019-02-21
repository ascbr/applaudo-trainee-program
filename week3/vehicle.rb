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
      @extras.each do |e|
        puts '--------------------------------------------------------'
        puts e.to_s
      end
      puts '--------------------------------------------------------'
      puts "\ttotal:\t$ #{total_price.round(2)}"
    end

  end
  
  def add_extra(extra)
    @extras.push(extra)
  end

  def remove_extra(extra)
    @extras.delete(extra)
  end

  def total_price
    sum_extra = 0
    @extras.each do |e|
      sum_extra += e.price
    end
    @total_price = sum_extra + @price
  end

  def find_extra_in_vehicle(name)
    found = @extras.select { |e| e.name == name }
    found[0]
  end

end
