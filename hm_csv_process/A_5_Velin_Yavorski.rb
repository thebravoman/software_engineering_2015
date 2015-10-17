require 'csv'

input_file = ARGV[0]
command = ARGV[1].to_s
option1 = ARGV[2]
option2 = ARGV[3]
=begin
items = ["Item","Coca-Cola","Fanta","Sprite","Nestea"]
dates = ["Date","2015-10-15","2015-10-17","2015-11-01","2015-10-27"]
costs = ["Cost",1, 7, 2, 4]

data_out = []
len = items.length-1

CSV.open('purchases.csv', 'w') {|csv|}

0.upto(len).each do |n|
  CSV.open('purchases.csv','a+') do |csv|
    data_out = [items[n], dates[n], costs[n]]
    csv << data_out
  end
end
=end
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
