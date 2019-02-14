require 'time'
require 'date'

#class for events
class EventStr
  attr_accessor :title, :date, :n_line, :valid

  def initialize(title, date, n_line, valid)
    @title = title
    @date = date
    @n_line = n_line
    @valid = valid
  end
  def to_s
    n_line.to_s + "," + title.to_s + "," + date.strftime('%d/%m/%Y %H:%M:%S %z') + "," + valid.to_s
  end
end

#class just for text color in console
class String
    def red; colorize(self, "\e[1m\e[31m"); end
    def green; colorize(self, "\e[1m\e[32m"); end
    def dark_green; colorize(self, "\e[32m"); end
    def yellow; colorize(self, "\e[1m\e[33m"); end
    def blue; colorize(self, "\e[1m\e[34m"); end
    def dark_blue; colorize(self, "\e[34m"); end
    def pur; colorize(self, "\e[1m\e[35m"); end
    def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end

#graphic function
def graphic_console_txt (q1,q2,cat1,cat2,op_print,txt_file)
  total = q1 + q2
  pv = (q1/total.to_f)*100
  pi = (q2/total.to_f)*100

  str_sc = "#{" "*8}"

  index = 0
  (0..100).to_a.each do |i|
    if (index == i)
      str_sc += (i.to_s+"   ")
      index +=10
    end
  end

  if(op_print == true)  #console
    puts "\nGraphic:"
    puts "╔#{"═"*75}╗"
    puts
    puts "#{" "*8}#{"█".dark_blue*(0.5*pv).to_i} <#{q1}>"
    puts "#{" "*8}#{"█".dark_blue*(0.5*pv).to_i} <#{pv}%>"
    puts
    puts "#{" "*8}#{"█".red*(0.5*pi).to_i} <#{q2}>"
    puts "#{" "*8}#{"█".red*(0.5*pi).to_i} <#{pi}%>"
    puts
    puts "#{" "*8}├────#{"┼────"*9}┤"
    puts str_sc +"(%)"
    puts
    puts "#{" "*8}#{"█".dark_blue*1} #{cat1}"
    puts
    puts "#{" "*8}#{"█".red*1} #{cat2}"
    puts "╚#{"═"*75}╝"
    puts


  elsif(op_print == false)
    puts "\n printing graphic to file"            #txt
    txt_file.puts "\nGraphic:"
    txt_file.puts "╔#{"═"*75}╗"
    txt_file.puts
    txt_file.puts "#{" "*8}#{"▓"*(0.5*pv).to_i} <#{q1}>"
    txt_file.puts "#{" "*8}#{"▓"*(0.5*pv).to_i} <#{pv}%>"
    txt_file.puts
    txt_file.puts "#{" "*8}#{"░"*(0.5*pi).to_i} <#{q2}>"
    txt_file.puts "#{" "*8}#{"░"*(0.5*pi).to_i} <#{pi}%>"
    txt_file.puts
    txt_file.puts "#{" "*8}├────#{"┼────"*9}┤"
    txt_file.puts str_sc +"(%)"
    txt_file.puts
    txt_file.puts "#{" "*8}#{"▓"*1} #{cat1}"
    txt_file.puts
    txt_file.puts "#{" "*8}#{"░"*1} #{cat2}"
    txt_file.puts "╚#{"═"*75}╝"
    txt_file.puts
  end
end

#read file
line= []
valid_events_array = []
invalid_events_array = []
num_line = 0
puts 'PROGRAM TO READ AND VALIDATE DATES FROM A FILE'
puts 'Enter the path and name to the file whit the dates'
puts
file_name = gets.chomp
puts
begin
file = File.open(file_name,"r") do |f|
  while line = f.gets
    num_line = num_line +1
    begin
      l=line.split(',')
      #check date format
      d  =  DateTime.strptime(l[1].slice(0..l[1].length-2)+" -06",'%d/%m/%Y %H:%M:%S %z')
      #change to EST, (UTC-5)
      d = d.to_time.getlocal("-05:00")
      event = EventStr.new(l[0], d , num_line, true)
      valid_events_array << event # add to valid array
    rescue  => e
      puts "Error, invalid date format at line #{num_line}"
      event = EventStr.new(l[0], l[1] , num_line, false)
      invalid_events_array << event #add to invalid array
    end
  end
end
#write valid dates to file
begin
  valids = File.open("valids.csv", "w")
  valid_events_array.sort_by{|e|  e.date }.each do |event|
    valids.puts "#{event.date.strftime("%d/%m/%Y %H:%M:%S %z")}"
  end
  #txt graphic
  graphic_console_txt(
                        valid_events_array.length,
                        invalid_events_array.length,
                        "valids",
                        "invalids",
                        false,
                        valids
                      )
rescue => e
  puts "Error, #{e.message}"
end

#write invalid
begin
  invalids = File.open("invalids.csv", "w")
  invalid_events_array.each do |event|
    invalids.puts "#{event.n_line},#{event.title},#{event.date}" #line number,
  end
rescue => e
  puts "Error, #{e.message}"
end

#console graphic
graphic_console_txt(
                      valid_events_array.length,
                      invalid_events_array.length,
                      "valids",
                      "invalids",
                      true,
                      ''
                    )
puts
puts "Files \"valids.csv\" and \"invalids.csv\" are created in the current folder."
puts "Graphic also saved in \"valids.csv\""
rescue => e
  puts "Error, #{e.message}"
end
