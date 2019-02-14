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


#read file
line= []
valid_events_array = []
invalid_events_array = []
num_line = 0

begin
file = File.open("events.csv","r") do |f|
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
rescue => e
  puts "Error, #{e.message}"
end

#write valid dates to file
begin
  valids = File.open("valids.csv", "w")
  valid_events_array.sort_by{|e|  e.date }.each do |event|
    valids.puts "#{event.date.strftime("%d/%m/%Y %H:%M:%S %z")}"
  end
  valids.puts "\nGraphic:"
  valids.puts "╔#{("═"*(valid_events_array.length + 31))}╗"
  valids.puts
  valids.puts " valids:      #{('▒'*valid_events_array.length)} <#{valid_events_array.length}>"
  valids.puts
  valids.puts " invalids:    #{('░'*invalid_events_array.length)} <#{invalid_events_array.length}>"
  valids.puts "#{" "*14}#{"-"*(valid_events_array.length + 10)}"
  index = 0
  str_index =" "*14
  (0..(valid_events_array.length + 10)).each do |i|
    if (index == i)
      str_index += (i.to_s+"#{" "*8}")
      index+= 10
    end
  end

  valids.puts str_index
  valids.puts "╚#{("═"*(valid_events_array.length + 31))}╝"

rescue => e
  puts "Error, #{e.message}"
end

#write invalid
begin
  invalids = File.open("invalids.csv", "w")
  invalid_events_array.each do |event|
    invalids.puts "#{event.n_line},#{event.title},#{event.date}" #line number,event title,date
  end
rescue => e
  puts "Error, #{e.message}"
end

#graphic
puts "\nGraphic:"
puts "╔#{("═"*(valid_events_array.length + 31))}╗"
puts
puts " valids:      #{('█'*valid_events_array.length).dark_blue} <#{valid_events_array.length}>"
puts
puts " invalids:    #{('█'*invalid_events_array.length).red} <#{invalid_events_array.length}>"
puts "#{" "*14}#{"-"*(valid_events_array.length + 10)}"
index = 0
str_index =" "*14
(0..(valid_events_array.length + 10)).each do |i|
  if (index == i)
    str_index += (i.to_s+"#{" "*8}")
    index+= 10
  end
end

puts str_index
puts "╚#{("═"*(valid_events_array.length + 31))}╝"
