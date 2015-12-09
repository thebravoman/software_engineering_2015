require 'csv'

file = ARGV[0]
date = ARGV[1]
csv = CSV.read file
csv.each do |line|
  if line[0] == date
	line.each do |e|
		print"#{e},"
	end
	puts ""
  end
end