# Class extra
class Extra
  attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    puts "\t#{@name} ($ #{@price})"
  end
end
