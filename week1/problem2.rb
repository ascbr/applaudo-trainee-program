
a = []
puts "**HISTOGRAM**"
begin

  puts "Enter an element to be added to the array or \"q\" to finish"
  op = gets.chomp
  if op.to_i != 0
    a.push(op.to_i)
  elsif op != "q"
      a.push(op)
  end

end until op == "q"

class Array
  def to_histogram
    diferent = self.uniq
    histogram = {}
    diferent.each do |el|
      count = []
      count = self.select { |v| v == el }
      histogram [el] = count.length
    end
    return histogram
  end
end

puts "\narray: #{a.inspect}"
if a.length > 0
    puts "histogram: #{a.to_histogram}"
else
    puts "Array is empty"
end
