require 'csv'
fopen = CSV.read ARGV[0]
data = ARGV[1]
suma = ARGV[2]
fopen.each do |colona|
if colona[0] == data && colona[2].to_i <= suma.to_i + 10 && colona[2].to_i >= suma.to_i - 10
	puts column
end
end
