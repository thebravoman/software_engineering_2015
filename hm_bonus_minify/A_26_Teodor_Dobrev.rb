require 'CSV'

file_name = ARGV[0]
date_given = ARGV[1]
value = ARGV[2]

array = []
counter = 0

CSV.foreach("#{file_name}") do |row|
  if row.first == date_given
	array[counter] = row
	counter = counter+1
  end
end

array.sort {|x,y| x <=> y}
array.each { |a| puts "#{a}" }