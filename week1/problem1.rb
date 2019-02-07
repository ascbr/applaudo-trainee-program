
def alphabetichal_order(num)
   start_ = "a";
   end_ = "z" * num.to_i;
   if num.to_i <= 0 || num.to_i > 5
      puts "Error, number of iterations must be > 0 and <= 4"
   else
      array = (start_..end_).to_a
      puts array.join(",")
      puts "array length: #{array.length}"
   end
end

puts "Insert the number of iterations."
var_num = gets.chomp

alphabetichal_order var_num
