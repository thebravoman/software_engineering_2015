require 'date'

file = ARGV[0]
sec_argv = ARGV[1]
value = ARGV[2]
res = []
hash = Hash.new
counter = 0
counter1 = 0
sum = 0
$is_there_value = false
$string = false
$date = false

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

def is_string_or_date sec_argv
  if(is_valid_date? sec_argv)
    $date = true
  else
    $string = true
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
<<<<<<< HEAD
    currency = line[4].to_s
    description = line[5]

    if(is_valid_date? sec_argv)
      if (date == sec_argv && !$is_there_value)
        puts line.join(',')
      elsif ( date == sec_argv && $is_there_value && (amount >= value.to_i-10 && amount <= value.to_i+10) )
        puts line.join(',')
      end
    else
      sec_argv = sec_argv.to_s
      if( account == sec_argv )
        arr << date
        arr2 << line
        res = arr.sort_by{|date| d,m,y=date.split("/");[y,m,d]}
        hash["#{date}"] = line
        sum = sum + amount
      end
    end
  end
  if(!is_valid_date? sec_argv)
    hash.each_key do |key|
      key = res[counter1]
      counter1 += 1
      puts hash.values_at(key).join(',')
=======
    if line[0] == sec_argv && !$is_there_value
      puts line.join(',')
    elsif line[0] == sec_argv && $is_there_value && (amount >= value.to_i-10 && amount <= value.to_i+10)
      puts line.join(',')
>>>>>>> 5725d0e26affd2f9757f71074fee30db9b79e0f6
    end
    puts sum.to_i
  end
end
