require 'csv'

file = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
csv = CSV.read file

csv.each do |line|
  if line[0] == date && line[3].to_i > value-10 && line[3].to_i < value+10
	line.each do |e|
	  print"#{e},"
	end
	puts ""
  end
end