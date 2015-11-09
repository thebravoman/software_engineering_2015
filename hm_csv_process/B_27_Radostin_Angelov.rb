require 'csv'
fullPath = ARGV[0]
command = ARGV[1]

#ruby my_program.rb file.csv sort 0 ASC
#ruby my_program INPUT_FILE [COMMAND] [OPTIONS]

def sort_result(fullPath, columnNumber, type)
  puts "asd"
  columnNumber = columnNumber.to_i
  my_csv = CSV.read fullPath
  if type == 'ASC'
    my_csv.sort! { |a,b|  a[columnNumber].to_s <=> b[columnNumber].to_s}
  elsif type == 'DESC'
    my_csv.sort! { |a,b|  -(a[columnNumber].to_s <=> b[columnNumber].to_s)}
  end

  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
  end
end

def filter_cost(fullPath, min_value, max_value)
  my_csv = CSV.read fullPath

  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element|
      #would be nice if it worked :)
       if element[2].to_i >= min_value.to_i and element[2].to_i <= max_value.to_i
         csv << element
       end
    }
  end
end

if command == 'sort'
  columnNumber = ARGV[2]
  type = ARGV[3]

  sort_result(fullPath, columnNumber, type)
elsif command == 'filter_costs'
  min_cost = ARGV[2]
  max_cost = ARGV[3]

  filter_cost(fullPath, min_cost, max_cost)
end



#[a[0],a[1].to_i] <=> [b[0],b[1].to_i]
