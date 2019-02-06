#------------leer arreglo--------------------------------------------
puts "***PROGRAM TO CALCULATE THE MEAN, MODE AND MEDIAN OF AN ARRAY***"
puts "Enter the array"
array = []
begin
  puts "Enter a number > 0 to be added to the array or \"q\" to finish"
  op = gets.chomp
  if op.to_i == 0 && op != "q"
    puts "Error, you did not enter a number > 0."
  else
    if op.to_i != 0
      array.push(op.to_i)
    end
  end

end until op == "q"

puts "\narray : #{array.inspect}\n"


#------------funciones--------------------------------------------

def mean(array_)
  sum = 0;
  array_.each { |e| sum = sum + e }
  return sum/(array_.length).to_f
end

def mode(array_)
  diferent = array_.uniq
  frecuency_hash = {}
  mode_hash = {}
  diferent.each do |e|
      frecuency_hash [e] = array_.count{ |x| x == e }
  end
  max_ =  frecuency_hash[array_[0]]
  key_ = array_[0]

  frecuency_hash.each do |key, value|
      if value > max_
        max_ = value
        key_ = key
      end
  end
  frecuency_hash.each do |key, value|
      if value == max_
        mode_hash [key] = value
      end
  end
  return mode_hash
end

def median(array_)
   a_sort = array_.sort
  if (a_sort.length % 2) == 0
    return (a_sort[a_sort.length/2-1] + a_sort[a_sort.length/2])/2.to_f
  else
    return a_sort[((a_sort.length-1)/2)]
  end
end

#------------calculos--------------------------------------------
if array.length != 0
  puts "\nmean: #{mean(array)}"
  puts
  mode(array).each { |key, value| puts "mode is: #{key}, frequency: #{value} " }
  puts "\nmedian:  #{median(array)}"
else
  puts "Array is empty."
end
