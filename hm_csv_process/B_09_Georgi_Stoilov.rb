require 'csv'

file = CSV.read(ARGV[0])
command = ARGV[1]
my_csv = CSV.read 'result.csv'

CSV.open("result.csv", 'w') do |csv_array|
  file.each do |element| 
    csv_array << element
  end
end

def sort column
  my_csv = CSV.read 'result.csv'
  if(column == 2)
    my_csv.sort! { |a, b| a[column].to_i <=> b[column].to_i}
    CSV.open("result.csv", "w") do |csv|
      my_csv.each do |line| 
        csv << line
      end
    end
  else 
    my_csv.sort! { |a, b| a[column].to_s <=> b[column].to_s}
    CSV.open("result.csv", "w") do |csv|
      my_csv.each do |line| 
        csv << line
      end
    end
  end
end

if (command == 'sort')
  option1 = ARGV[2].to_i
  option2 = ARGV[3]
  if(option2 == 'ASC')
    my_csv = sort option1
  end
  if(option2 == 'DESC')
    my_csv = sort option1
    my_csv.reverse!
    CSV.open("result.csv", "w") do |csv|
      my_csv.each {|line| 
      csv << line}
    end
  end
end

if (command == 'filter_costs')
  min_value = ARGV[2].to_i
  max_value = ARGV[3].to_i
  CSV.open('result.csv', 'w') do |csv|
    my_csv.each do |line|
      line[2] = line[2].to_i
      if line[2] >= min_value && line[2] <= max_value
        csv << line
      end
    end
  end
  my_csv = sort 2
end
