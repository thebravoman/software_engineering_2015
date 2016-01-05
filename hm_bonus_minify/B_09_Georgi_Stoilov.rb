require 'date'

file = ARGV[0]
sec_argv = ARGV[1]
value = ARGV[2]

sum = 0

#arrays
res = []
arr3 = []

hash = Hash.new

#help varaibles
datte = 0
help = 0
save_line = 0

$is_there_value = false
$string = false
$date = false

#counters:
counter1 = 0
counter = 0
c = 0
i = 0

def check_value value
  if value.nil?
    $is_there_value = false
  else
    $is_there_value = true
  end
end

def is_valid_date? sec_argv
  sec_argv = sec_argv.split('/')
  day = sec_argv[0].to_i
  month = sec_argv[1].to_i
  year = sec_argv[2].to_i
  if( Date.valid_date?(year,month,day) )
    true
  else
    false
  end
end

check_value value

file = File.open(file, 'r') do |f|
  arr = Array.new
  arr2 = Array.new
  f.each_line do |line|
    line = line.split(' ')
    date = line[0]
    account = line[1].to_s
    category = line[2].to_s
    amount = line[3].to_i
    currency = line[4].to_s
    description = line[5]

    if(is_valid_date? sec_argv) #version 1 and 2
      if (date == sec_argv && !$is_there_value)
        puts line.join(',')
      elsif ( date == sec_argv && $is_there_value && (amount >= value.to_i-10 && amount <= value.to_i+10) )
        puts line.join(',')
      end
    else #version 3
      sec_argv = sec_argv.to_s
      if( account == sec_argv )
        arr << date
        arr2 << line
        if(datte == date)
          if(i < 1)
            arr3 << save_line.join(',')
            arr3 << line.join(',')
          else
            arr3 << line.join(',')
          end
          i = i + 1
          help = datte
        else
          res = arr.sort_by{|date| d,m,y=date.split("/");[y,m,d]}
          hash["#{date}"] = line
          save_line = line
        end
        sum = sum + amount
        datte = date
      end
    end
  end
  if(!is_valid_date? sec_argv) # version 3 continue
    res.each do |element|
      key = element
      if(key == help)
        puts arr3[c]
        c = c + 1
      else
        puts hash.values_at(key).join(',')
      end
    end
    puts sum.to_i
  end
end
