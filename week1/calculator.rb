puts 'CALCULATOR'

begin
  puts 'Insert the firts number'
  n1 = gets.chomp
end until n1.to_f != 0

begin
  puts 'Insert the second number'
  n2 = gets.chomp
end until n2.to_f != 0
begin
  puts "Seleccionar opcion \n"+
    "1- Sum\n"+
    "2- Subtraction\n"+
    "3- Multiplication\n"+
    "4- Division\n"

  op = gets.chomp
end until op.to_i != 0

case op.to_i
  when 1
    puts "result #{n1}+#{n2} = #{n1.to_f+n2.to_f}"
  when 2
    puts "result #{n1}-#{n2} = #{n1.to_f-n2.to_f}"
  when 3
    puts "result #{n1}*#{n2} = #{n1.to_f*n2.to_f}"
  when 4
    puts "result #{n1}/#{n2} = #{n1.to_f/n2.to_f}"
  else
    puts 'opcion no valida'
end
