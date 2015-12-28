require 'csv'
file_name = ARGV[0]
string = ARGV[1]
val = ARGV[2]
array = []
value = 0
my_csv = CSV.read file_name
my_csv.each { |line|
  splitting = line[0].split(' ')
  if splitting[1] == string.to_s
    array << line
    value = value + line[3].to_i
  elsif splitting[0] == string.to_s
    if val != nil
      if splitting[3].to_i > (val.to_i - 10) && splitting[3].to_i < (val.to_i + 10)
        array << line
      end
    else
      array << line
    end
  end
}

array.sort_by! {|date|
  date_keeper = date.first.split('/')
  year = date_keeper[2].to_i
  month = date_keeper[1].to_i
  day = date_keeper[0].to_i
  [year, month, day]
}

array.each {|element|
  puts element.join(",")
}
puts value if value != 0
