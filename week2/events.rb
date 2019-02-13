#file = File.new("events.csv", "r")
lines = []

#while line = file.gets
#   l=line.split(',')
#   puts "#{l[0]} - #{l[1]}"
#end
#file.close

def check_date(str_date)
  valid = ""
  #check format
  pattern = Regexp.new(
                        '((0)[1-9]|[1-2][0-9]|(3)[0-1])/'+      #days
                        '((0)[1-9]|(1)[0-2])/'+                 #months
                        '((1)(9)([0-9]{2})|(2)(0)([0-9]{2}))'+  #years
                        ' ([0-1][0-9]|(2)[0-4]):'+              #hours
                        '((0)[1-9]|[1-5][0-9]):'+               #minuts
                        '((0)[1-9]|[1-5][0-9])'                 #seconds
                      )

  valid = pattern.match(str_date).to_s
  puts valid
  if(valid != "")
    date=valid.split(" ")
    splited_date = date[0].split('/')
    splited_time = date[1].split(':')

    #check if bisiesto
    if(splited_date[1].to_i == 2 && splited_date[0].to_i == 29)
      if((splited_date[2].to_i % 400) == 0)
        puts 'bisiesto'
      elsif ((splited_date[2].to_i % 4) == 0 && (splited_date[2].to_i % 100) != 0)
        puts 'bisiesto'
      else
        puts 'invalid date'
      end

    end
    #check if 31 days months
    if(splited_date[0].to_i == 31 && [1, 3, 5, 7, 8, 10, 12].include?(splited_date[1].to_i))
      puts 'valid'
    else
      puts 'invalid'
    end

  else
    puts "invalid format"
  end
end

check_date "31/02/2010 04:12:50"


class EventStr
  attr_accessor :title, :date, :n_line, :valid

  def initialize (title, date, n_line)
    @title = title
    @date = date
    @n_line = n_line
  end

end
