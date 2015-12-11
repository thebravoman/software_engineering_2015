require 'csv'
require 'date'

DATE_FORMAT = "%d/%m/%Y"

class String
  def numeric?
    return true if self =~ /\A\d+\Z/
    true if Float(self) rescue false
  end
end

def print_rows(arr)
  arr.each do |inner_arr|
    puts "#{inner_arr.join(",")}"
  end
end

filename = ARGV[0]
second_arg = ARGV[1]
value = ARGV[2].to_i if ARGV[2] != nil

contents = []
CSV.foreach(filename) do |row|
  contents.push(row)
end

# Remove headers
contents.shift

begin
  date = Date.strptime(second_arg, DATE_FORMAT)
  if value == nil # First task
    matched = contents.select { |x| Date.strptime(x[0], DATE_FORMAT) == date }
  else # Second task
    matched = contents.select { |x| Date.strptime(x[0], DATE_FORMAT) == date &&
                          x[3].to_i >= value - 10 && x[3].to_i <= value + 10 }
  end
  print_rows(matched)
rescue ArgumentError
  if second_arg.numeric? # Sixth task
  elsif second_arg == 'xml' # Fourth task
  else # Third task
    matched = contents.select { |x| x[1] == second_arg }
    matched.sort! { |x, y| Date.strptime(x[0], DATE_FORMAT) <=> Date.strptime(
                                                          y[0], DATE_FORMAT) }
    sum = matched.map { |x| x[3].to_i }.inject { |sum, amount| sum + amount }

    print_rows(matched)
    puts sum
  end
end
