#!/usr/bin/ruby
require 'csv'
folder = ARGV[0]

Dir.glob(folder+"*").each do |filename|
name = filename.split("/").last.split("_")
if name.size == 3 
	firstname = name[0]
	lastname = name[1]
end
if lastname == 10
	my_csv << firstname+lastname
end
end

my_csv.sort!{ |a, b|
	 a[1]<=>b[1]}


CSV.open("result.csv","w") do |csv_array|
my_csv.each do |row|
csv_array << row
end
end
