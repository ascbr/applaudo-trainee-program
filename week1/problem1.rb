
def alphabetichal_order_2array(num) # saves range to an array
  start_ = 'a'
  end_ = 'z' * num.to_i
  if num.to_i <= 0 || num.to_i > 5
    puts 'Error, number of iterations must be > 0 and <= 4'
  else
    array = (start_..end_).to_a
    puts array.join(', ')
    puts "array length: #{array.length}"
  end
end

def alphabetichal_order(num) 
   # just prints the range
  start_ = 'a'
  end_ = 'z' * num.to_i
  if num.to_i <= 0 || num.to_i > 5
    puts 'Error, number of iterations must be > 0 and <= 4'
  else
    (start_..end_).each do |x|
      if x != end_
        print x, ', '
      else
        print x
      end
    end
    puts
  end
end

puts 'Enter the number of iterations.'
var_num = gets.chomp

alphabetichal_order var_num
# alphabetichal_order_2array var_num
