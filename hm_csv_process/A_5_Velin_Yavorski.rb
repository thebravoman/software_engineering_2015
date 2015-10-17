require 'csv'

input_file = ARGV[0]
command = ARGV[1].to_s
option1 = ARGV[2]
option2 = ARGV[3]

my_csv = CSV.read input_file

if(command.eql? "sort")
  option1 = option1.to_i
  if(option2.eql? "ASC")
    my_csv[1..-1] = my_csv[1..-1].sort_by{|c| c[option1]}
  elsif(option2.eql? "DESC")
    my_csv[1..-1] = my_csv[1..-1].sort_by{|c| c[option1]}.reverse
  end
  CSV.open('result.csv','w') do |csv|
    my_csv.each {|element| csv << element}
  end
end

if(command.eql? "filter_costs")
  option1 = option1.to_i
  option2 = option2.to_i
  CSV.open('result.csv','w') do |csv|
    csv << my_csv[0]
    my_csv[1..-1].each do |element|
      if(element[2].to_i.between?(option1, option2))
        csv << element
      end
    end
  end
  my_csv = CSV.read 'result.csv'
  my_csv[1..-1] = my_csv[1..-1].sort_by {|c| c[2]}
  CSV.open('result.csv','w') do |csv|
    my_csv.each {|element| csv << element }
  end
end
